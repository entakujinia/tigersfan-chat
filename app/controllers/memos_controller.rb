class MemosController < ApplicationController
  def index
     @memo = Memo.all.order(id: "DESC")
  end

  def create
    Memo.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    memo = Memo.find(params[:id])
    if memo.checked 
      memo.update(checked: false)
    else
      memo.update(checked: true)
    end

    item = Memo.find(params[:id])
    render json: { post: item }
  end
 
end
