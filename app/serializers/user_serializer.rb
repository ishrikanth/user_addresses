class UserSerializer < ActiveModel::Serializer
  #set_type :user
  attributes :full_name,:age
  # attributes :addresses do
  #   attributes :name
  # end
  has_many :addresses

end
