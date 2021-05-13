class Notifier < ApplicationMailer
    default from: 'healthfoodstore99@gmail.com'

    def out_of_stock_mailer(user_id, product_id)
        @user = User.find_by(id: user_id) 
        @product = Product.find_by(id: product_id)
        mail(to: @user.email, subject: "Out of stock Notification")
    end
end
