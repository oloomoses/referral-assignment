class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :username, :email
  has_many :referals
end
