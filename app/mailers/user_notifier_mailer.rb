class UserNotifierMailer < ApplicationMailer


  def send_received_message(email, link)
    mail( to: email,
    subject: 'You have new message from MiniChat',
    body: "Please visit below link to read it \n #{link}" );
  end
end
