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
    @message = Message.new
    @friends = User.find(current_user.friend_list)
  end

  def create
    @message = Message.new(message_params)
    @recipient = User.find_by_id(message_params[:recipient_id]).name
    if @message.save
      flash[:success] = "Sent message to #{@recipient}"
      redirect_to sent_messages_path and return
    else
      flash[:error] = "Failed to sent message to #{@recipient}"
    end
    render 'new_messages'
  end

  def message_params
    message_params = params.require(:message).permit(:recipient_id, :subject, :body)
    message_params.merge!(sender_id: params[:sender_id])
  end

end
