class GuidePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    allow_user?
  end

  def new?
    user?
  end

  def create?
    user?
  end

  def edit?
    user?
  end

  def update?
    user?
  end

  private

  def allow_user?
    record.kit.orders.each do |order|
      order.user = user
    end
  end

  def user?
    record.kit.restaurant.user == user
  end
end
