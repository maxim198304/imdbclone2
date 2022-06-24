class MoviePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    false
  end

  def update?
    return true if user_signed_in?
  end

  def destroy?
    return true if user_signed_in?
  end

  class Scope < ApplicationPolicy::Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
