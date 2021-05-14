class Notifier < ApplicationMailer
    default from: 'healthfoodstore99@gmail.com'

    def out_of_stock_email(product_id)
        @admin_user_emails = User.where(isadmin: true).map(&:email).join(", ")
        @product = Product.find_by(id: product_id)
        
        mail(to: @admin_user_emails, subject: 'Out of stock Notification for #{@product.name}')
    end
end
