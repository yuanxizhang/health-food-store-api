class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :isadmin
end
