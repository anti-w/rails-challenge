class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def update?
    verify_user?
  end

  def destroy?
    verify_user?
  end

  def verify_user?
    user.kind == 'AD' or user.id == comment.user.id
  end
end
