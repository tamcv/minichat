class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages.order("created_at DESC")
  end

  def sent_messages
    @messages = current_user.sent_messages.order("created_at DESC")
  end
end
