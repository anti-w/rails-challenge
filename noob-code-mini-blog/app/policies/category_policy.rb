class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def update?
    verify_user?
  end

  def create?
    verify_user?
  end

  def destroy?
    verify_user?
  end

  def verify_user?
    user.kind == 'AD'
  end
end
