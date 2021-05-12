class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand, :description, :instock
end
