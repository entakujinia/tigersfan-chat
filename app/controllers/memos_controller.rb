class MemosController < ApplicationController
  def index
    @memo = Memo.all.oeder(id: "DESC")
  end
end
