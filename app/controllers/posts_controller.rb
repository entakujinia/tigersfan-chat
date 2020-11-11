class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: 'DESC')
    @user = User.all
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json: { post: post }
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy 
    render json: { post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
