class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages.order("created_at DESC").page params[:page]
    params[:page] = 'inbox'
  end

  def sent_messages
    @messages = current_user.sent_messages.order("created_at DESC").page params[:page]
    params[:page] = 'sent_messages'
  end

  def friends
    @users = User.all
    params[:page] = 'add_friends'
  end

  def new_messages
    params[:page] = 'new_messages'
    @message = Message.new
  end

  def create
      params[:message][:recipient_ids].each do |recipient_id|
        unless recipient_id.blank?
          @message = Message.new(message_params)
          @message.sender_id = current_user.id
          @message.recipient_id = recipient_id
          @recipient = User.find_by_id(recipient_id)
          unless @recipient.block_list.include? current_user.id
            unless @message.save
              flash[:error] = "Failed to sent message"
              render 'new_messages' and return
            end
          end
        end
      end
    flash[:success] = "Sent message successfully"
    redirect_to sent_messages_path
  end

  def show
    @message = Message.find(params[:id])
    if current_user.id != @message.recipient_id
      flash[:error] = "Please do not try to read message of other people!"
      redirect_to root_path and return
    end

    if @message.is_read == true
      flash[:error] = "This message has been read!"
      redirect_to root_path and return
    else
      #@message.is_read = true
      #@message.save
    end
  end

  def message_params
    message_params = params.require(:message).permit(:subject, :body, :photo)
  end

end
