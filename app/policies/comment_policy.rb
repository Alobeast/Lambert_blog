class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
      true
  end

  def update?
      user_is_owner_or_admin?#only owner can modify the comment
  end

  def destroy?
      user_is_owner_or_admin?#only owner can modify the comment
  end

  private
  def user_is_owner_or_admin?
    user.admin || record.user == user
  end
end
