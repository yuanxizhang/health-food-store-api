class Product < ApplicationRecord
    validates :name, presence: true

    scope :out_of_stock, -> { where('instock < 1') }

    after_update :send_email_if_out_of_stock

    def send_email_if_out_of_stock
        if column_name_changed? && !email_sent?
        # Send email here
            update_attribute :email_sent, true
        end
    end
end
