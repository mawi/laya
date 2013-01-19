class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new
      if user.is_admin?
        can :manage, :all
      else
        can :read, :all
        can :manage, Project
      end
  end
end