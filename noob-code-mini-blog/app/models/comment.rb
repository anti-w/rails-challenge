class Comment < ApplicationRecord

  include CommentQuery

  belongs_to :post
  belongs_to :user
end
