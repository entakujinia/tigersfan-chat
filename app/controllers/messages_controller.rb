class MessagesController < ApplicationController
  def new
    @user = User.new
  end
end

