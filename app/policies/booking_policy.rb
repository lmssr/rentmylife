class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true # anyone can visit the show page
  end

  def create?
    return true
  end

  def update?
    # `user` set to current_user
    # `record` the restaurant in question
    # (@restaurant)

    user_is_owner?
  end

  def destroy?
    user_is_admin?
  end

  private

  def user_is_owner?
    return user == record.user
  end
end
