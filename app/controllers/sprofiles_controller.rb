class SprofilesController < ApplicationController
  before_filter :authenticate_student!
  
  def new
    @sprofile = Sprofile.new
    @sprofile.student_id = current_student.id
    @departments = Department.order(:title)
    @courses = Course.order(:title)
  end
  
  def create
    @sprofile = Sprofile.new(params[:sprofile])
    @departments = Department.order(:title)
    @courses = Course.order(:title)
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
      @departments = Department.order(:title)
      @courses = Course.order(:title)
    end
    
    def update
      @sprofile = Sprofile.find_by_student_id(params[:id])
      @departments = Department.order(:title)
      @courses = Course.order(:title)
      if @sprofile.update_attributes(params[:sprofile])
        flash[:notice] = "Your profile was successfully updated!"
        redirect_to sprofile_path(@sprofile)
      else
        flash[:notice] = "Update was not saved."
        render :action => 'edit'
      end
    end
    
    def update_courses
      department = Department.find(params[:department_id])
      @courses = department.courses.map{|c| [c.title, c.id]}.insert(0, "Select a Course")
    end
       
end
