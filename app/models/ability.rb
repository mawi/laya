class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.is_admin?
        can :manage, :all
      else
        can :read, Project
        can :manage, Client, :user_id => user.id
      end
  end
end