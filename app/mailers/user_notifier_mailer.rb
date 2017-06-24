class UserNotifierMailer < ApplicationMailer

  def send_received_message(email, link)
    mail( to: email,
    subject: 'You have new message from MiniChat',
    body: "Please visit below link to read it \n #{link} \n\n MiniChat.com" );
  end

  def send_read_message(email, name)
    t = Time.now
    mail(
      to: email,
      subject: 'Your message is read',
      body: "#{name} has read your message at #{t.strftime("%I:%M%p")} \n\n MiniChat.com"
    );
  end

end
