class NotificationMailer < ApplicationMailer
  default from: "no-reply@texascarnivores.com"

  def comment_added(comment)
    @shop = comment.shop
    @shop_owner = @shop.user
    mail(to: @shop_owner.email,
          subject: "A comment has been added to #{@shop.name}")
  end
end
