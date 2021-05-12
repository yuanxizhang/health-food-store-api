class Product < ApplicationRecord
    include ActiveModel::Dirty

    validates :name, presence: true
    validates :instock, numericality: { only_integer: true }
    validates :instock, inclusion: { in: 1..2000 }

    scope :out_of_stock, -> { where('instock < 1') }

    after_update :check_inventory

    def check_inventory
        if previous_changes['instock'].any? && self.instock.zero?
            # Send email here
            update_attribute :email_sent, true
        end
    end
end
