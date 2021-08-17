class PokespotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    return true
    # record.user == user
  end
end
