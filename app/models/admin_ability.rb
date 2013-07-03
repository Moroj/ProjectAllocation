class AdminAbility
  include CanCan::Ability
  
  
  def initialize
      can :manage, :all
      can :manage, Sprofile
  end
  
end