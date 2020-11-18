class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      ActionCable.server.broadcast 'post_channel', content: @post
    end
  end
end
