class OutOfStockNotifierMailer < ApplicationMailer
    def notify_purchaser(user)  
        @current_user = user  
        mail(to: @current_user.email, subject: "Time to reorder! Product is out of stock!")
    end
end
