class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at, :user

  belongs_to :user, serializer: UserSerializer, if: -> { instance_options[:list_user_infos] }
end
