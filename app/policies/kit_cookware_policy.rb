class KitCookwarePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    allow_user?
  end

  def create?
    allow_user?
  end

  def edit?
    allow_user?
  end

  def update?
    allow_user?
  end

  private

  def allow_user?
    record.kit.restaurant.user == user
  end
end
