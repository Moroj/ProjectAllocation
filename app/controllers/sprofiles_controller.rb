class SprofilesController < ApplicationController
  before_filter :authenticate_student!
  
  def index  
  end
  
  def new
    @sprofile = Sprofile.new
    @sprofile.student_id = current_student.id
  end
  
  def create
    @sprofile = Sprofile.new(params[:sprofile])
    @sprofile.student_id = current_student.id
    if @sprofile.save
      flash[:notice] = "You have created your profile successfully!"
      redirect_to root_path
    else
      flash[:notice] = "Profile not saved"
      render :action => 'new'
    end
  end
    
    def show
      @sprofile = Sprofile.find_by_student_id(params[:id])
      unless current_student.id == @sprofile.student_id  
        flash[:notice] = "You don't have access to this page!"
        redirect_to contact_path
        return
      end
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @sprofile }
      end
    end  
    
    def edit
      @sprofile = Sprofile.find_by_id(params[:id])
    end
    
    def update
      @sprofile = Sprofile.find_by_student_id(params[:id])
      if @sprofile.update_attributes(params[:sprofile])
        flash[:notice] = "Your profile was successfully updated!"
        redirect_to sprofile_path(@sprofile)
      else
        flash[:notice] = "Update was not saved."
        render :action => 'edit'
      end
    end
       
end
