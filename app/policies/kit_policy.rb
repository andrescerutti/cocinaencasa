class KitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !user.restaurants.count.zero?
  end

  def show?
    true
  end

  def update?
    allow_user?
  end

  def destroy?
    allow_user?
  end

  def category?
    true
  end

  private

  def allow_user?
    record.restaurant.user == user
  end
end
