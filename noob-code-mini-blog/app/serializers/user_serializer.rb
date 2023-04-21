class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :kind

  has_many :posts, serializer: PostSerializer

end
