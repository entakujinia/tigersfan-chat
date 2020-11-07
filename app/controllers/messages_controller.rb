class MessagesController < ApplicationController
  def new
    @user = User.new
    @room = Room.new
  end
end

