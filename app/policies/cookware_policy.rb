class IngredientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def edit?
    user?
  end

  def update?
    user?
  end

  def destroy?
    true
  end
end
