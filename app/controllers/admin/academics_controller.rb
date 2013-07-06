class Admin::AcademicsController < ApplicationController
  
  def index
     @academics = Academic.order(:email, :include => :aprofile)
   end

   def new 
     @academic = Academic.new
   end

   def create
     @academic = Academic.new
     @academic.accessible = :all if admin_signed_in?
     @academic.attributes =  params[:academic]

     if @academic.save
       redirect_to admin_academics_path
     else
       render :action => "new"
     end
   end

   def destroy
     @academic = Academic.find_by_id(params[:id])
     @aprofile = Aprofile.find_by_academic_id(params[:id])
     @academic.destroy
     redirect_to admin_academics_path
   end

   private

   def load_aprofile
     @aprofile = Aprofile.find_by_id(params[:id])
   end
end
