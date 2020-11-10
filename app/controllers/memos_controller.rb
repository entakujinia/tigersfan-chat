class MemosController < ApplicationController
  def index
     @memo = Memo.all.order(id: "DESC")
  end
end
