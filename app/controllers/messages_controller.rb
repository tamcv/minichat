class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages.order("created_at DESC")
    params[:page] = 'inbox'
  end

  def sent_messages
    @messages = current_user.sent_messages.order("created_at DESC")
    params[:page] = 'sent_messages'
  end

  def add_friends
    @users = User.all
    params[:page] = 'add_friends'
  end

  def new_messages
    params[:page] = 'new_messages'
  end

end
