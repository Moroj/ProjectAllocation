class AprofilesController < ApplicationController
  before_filter :authenticate_academic!
  
  def new
    @aprofile = Aprofile.new
    @aprofile.aprofile_id = current_academic.id
  end
  
  def create
    
    @aprofile = Aprofile.new(params[:aprofile])
    @aprofile.aprofile_id = current_academic.id
    if @aprofile.save
      flash[:notice] = "You have created your profile successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Profile not saved"
      render :action => 'new'
    end
  end
  
  def show
    
     @aprofile = Aprofile.find_by_aprofile_id(params[:id])
     unless current_academic.id == @aprofile.aprofile_id
       flash[:notice] = "You don't have access to this page!"
       redirect_to contact_path
       return
     end
     
     respond_to do |format|
       format.html # show.html.erb
       format.json { render :json => @aprofile }
     end
     end
end
