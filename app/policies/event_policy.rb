class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
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
    true
  end

  def update?
    is_owner?
  end

  def edit?
    is_owner?
  end

  def destroy?
    is_owner?
  end
  private

  def is_owner?
    record.user == user
  end
end
