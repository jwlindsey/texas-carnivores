class NotificationMailer < ApplicationMailer
  default from: "no-reply@texascarnivores.com"

  def comment_added
    mail(to: "j.w.lindsey1986@gmail.com",
          subject: "A comment has been added to your shop")
  end
end
