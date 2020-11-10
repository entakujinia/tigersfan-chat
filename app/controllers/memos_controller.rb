class MemosController < ApplicationController
  def index
     @memo = Memo.all.order(id: "DESC")
  end

  def create
    Memo.create(content: params[:content])
    redirect_to action: :index
  end
 
end
