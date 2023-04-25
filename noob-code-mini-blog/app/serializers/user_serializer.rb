class UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :kind

  has_many :posts, serializer: PostSerializer, if: -> { instance_options[:list_posts] }

end
