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
    record.user == user || admin?
  end

  def edit?
    update? || admin?
  end

  def destroy?
    record.user == user || admin?
  end

  private

  def admin?
    user.admin
  end
end
