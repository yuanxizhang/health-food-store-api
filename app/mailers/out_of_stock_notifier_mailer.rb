class OutOfStockNotifierMailer < ApplicationMailer
    default from: 'healthfoodstore99@gmail.com'

    def notify_admin_user(user_id, product_id)
        @user = User.find_by(id: user_id) 
        @product = Product.find_by(id: product_id)
        mail(to: @user.email, subject: "Out of stock Notification for {@product.name}")
    end
end
