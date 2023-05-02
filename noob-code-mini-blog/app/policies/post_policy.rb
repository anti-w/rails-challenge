class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    verify_user?
  end

  def destroy?
    verify_user?
  end

  def verify_user?
    user.kind == 'AD' or user.id == post.user.id
  end
end
