class AcademicAbility
  include CanCan::Ability
  
  
  def initialize(current_academic)
      can :read, Project  do |project|
        project.academic_id == current_academic.id
      end
      can :manage, Aprofile
  end

end