class AdminAbility
  include CanCan::Ability
  
  
  def initialize(current_admin)
      can :manage, :all
  end
  
end