class Product < ApplicationRecord

    validates :name,        presence: true, length: { maximum: 165 }
    validates :description, presence: true, length: { maximum: 2255 }
    validates :instock,     numericality: { only_integer: true }
    validates :instock,     inclusion: { in: 0..1000 }

    scope :out_of_stock, -> { where('instock < 1') }

    after_update :check_inventory

    protected

    def check_inventory
        if self.instock < 1
            # Send email to notify product out of stock
            OutOfStockNotifierMailer.notify_admin_user(current_user.id, self.id).deliver_now
        end
    end
end
