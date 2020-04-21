class StepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
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

  def destroy?
    allow_user?
  end

  private

  def allow_user?
    record.guide.kit.restaurant.user == user
  end
end
