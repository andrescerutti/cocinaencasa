class KitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def category?
    true
  end

  private

  def allow_user?
    record.user == user
  end
end
