class SprofilesController < ApplicationController
  before_filter :authenticate_student!
  
  
  
  def new
    @sprofile = Sprofile.new
    @sprofile.sprofile_id = current_student.id
  end
  
  def create
    
    @sprofile = Sprofile.new(params[:sprofile])
    @sprofile.sprofile_id = current_student.id
    if @sprofile.save
      flash[:notice] = "You have created your profile successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Profile not saved"
      render :action => 'new'
    end
  end
    
    def show
     
      @sprofile = Sprofile.find_by_sprofile_id(params[:id])
      unless current_student.id == @sprofile.sprofile_id
        flash[:notice] = "You don't have access to this page!"
        redirect_to contact_path
        return
      end
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @sprofile }
      end
      end  
      
     
end
