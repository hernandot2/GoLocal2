class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def update?
    owner?
  end

  def edit?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
