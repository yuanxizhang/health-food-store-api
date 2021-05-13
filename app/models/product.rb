class Product < ApplicationRecord

    validates :name,        presence: true, length: { maximum: 165 }
    validates :description, presence: true, length: { maximum: 2255 }
    validates :instock,     numericality: { only_integer: true }
    validates :instock,     inclusion: { in: 0..1000 }

    scope :out_of_stock, -> { where('self.instock < 1') }
end
