class NotificationMailer < ApplicationMailer

  def training_invite(receiver, sender, message)
      @receiver = receiver
      @sender = sender
      @message = message

      mail(to: "developerjenn@gmail.com"   ,
           subject: "#{@sender.username} wants to train with you!" ,
           reply_to: @sender.email
          )
  end
end
