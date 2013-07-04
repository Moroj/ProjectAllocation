class AprofilesController < ApplicationController
  before_filter :authenticate_academic!
  
  def new
    @aprofile = Aprofile.new
    @aprofile.academic_id = current_academic.id
  end
  
  def create
    @aprofile = Aprofile.new(params[:aprofile])
    @aprofile.academic_id = current_academic.id
    if @aprofile.save
      flash[:notice] = "You have created your profile successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Profile not saved"
      render :action => 'new'
    end
  end
  
  def show
    
     @aprofile = Aprofile.find_by_academic_id(params[:id])
     unless current_academic.id == @aprofile.academic_id
       flash[:notice] = "You don't have access to this page!"
       redirect_to contact_path
       return
     end
     
     respond_to do |format|
       format.html # show.html.erb
       format.json { render :json => @aprofile }
     end
  end
     
     def edit
       @aprofile = Aprofile.find_by_id(params[:id])
     end

     def update
       @aprofile = Aprofile.find_by_academic_id(params[:id])
       if @aprofile.update_attributes(params[:aprofile])
         flash[:notice] = "Your profile was successfully updated!"
         redirect_to aprofile_path(@aprofile)
       else
         flash[:notice] = "Update was not saved."
         render :action => 'edit'
       end
     end
     
end
