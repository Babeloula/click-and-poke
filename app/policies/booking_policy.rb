class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.pokespot.user != user
  end

  def show?
    true
  end

  def update?
    record.pokespot.user == user
  end
end
