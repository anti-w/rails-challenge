class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :comments, serializer: CommentSerializer, if: -> { instance_options[:list_comments] }
  belongs_to :user, serializer: UserSerializer
end
