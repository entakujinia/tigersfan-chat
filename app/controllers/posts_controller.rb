class PostsController < ApplicationController
   def index
    @posts = Post.all
    @post = Post.new
   end

   def create
    @post = Post.new(content: params[:content])
    ActionCable.server.broadcast 'post_channel', content: @post if @post.save
   end

   def destroy   
      post = Post.find(params[:id])
      post.destroy
   end
    
  
  private
   def post_params
      params.require(:post).permit(:content)
   end
end
