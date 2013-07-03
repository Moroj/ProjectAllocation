class ApplicationController < ActionController::Base
  protect_from_forgery
  #load_and_authorize_resource
 
  
 # def current_auth_resource
 #   if admin_signed_in?
  #    current_admin
  #  elsif academic_signed_in?
  #    current_academic
  #  else
  #    current_student
  #  end
  #end
  
  def current_ability 
      @current_ability ||= case 
                            when current_admin 
                              AdminAbility.new 
                            when current_academic
                              AcademicAbility.new
                            when current_student
                             StudentAbility.new
                            end
                           # Current_Ability.new (current_auth_resource)
    
  end
end

