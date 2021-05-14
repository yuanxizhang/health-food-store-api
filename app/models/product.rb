class Product < ApplicationRecord

    validates :name,    presence: true, length: { maximum: 120 }
    validates :instock, presence: true
    validates :instock, numericality: { only_integer: true }
    validates :instock, inclusion: { in: 0..1000 }

    scope :out_of_stock, -> { where('self.instock < 1') }
end
