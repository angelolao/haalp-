class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :pages

    # specify here which guest page are not accessible

    if user && user.poster?
      can :manage, Task
      can :manage, Offer
    elsif user && user.worker?
      can :manage, Task
      can :manage, Offer
    end
  end
end
