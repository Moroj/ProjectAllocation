class ApplicationController < ActionController::Base
  protect_from_forgery

 # def current_ability
  #  @current_ability ||= ::Ability.new(current_user)
  #end
  
  def current_ability 
      @current_ability ||= case 
                            when current_admin 
                              AdminAbility.new(current_admin)
                            when current_academic
                              AcademicAbility.new(current_academic)
                            else current_student
                             StudentAbility.new(current_student)
                            end
    
  end
end

