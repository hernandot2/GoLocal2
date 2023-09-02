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
    owner? || admin?
  end

  def edit?
    owner? || admin?
  end

  def destroy?
    owner? || admin?
  end

  private

  def owner?
    record.user == user
  end

  def admin?
    record.user.admin
  end
end
