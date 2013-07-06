class StudentAbility
  include CanCan::Ability
  
  
  def initialize(current_student)
      can :manage, Sprofile
      can :read, Project
  end
  
end