class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.is_admin?
        can :manage, :all
      else
        can :read, :all
        can :manage, Project
      end
  end
end