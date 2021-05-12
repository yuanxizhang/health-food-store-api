class Product < ApplicationRecord
    include ActiveModel::Dirty

    validates :name, presence: true
    validates :instock, numericality: { only_integer: true }
    validates :instock, inclusion: { in: 0..1000 }

    scope :out_of_stock, -> { where('instock < 1') }

    after_update :check_inventory

    protected

    def check_inventory
        if self.instock < 1
            # Send email to notify product out of stock
            OutOfStockNotifierMailer.notify_user.deliver
        end
    end
end
