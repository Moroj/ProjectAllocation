class Admin::CoursesController < AdminController
  before_filter :load_department
  def index
    @courses = @department.courses.order(:title)
    #@departments = Department.all
  end
  
  def show
    @course = @department.courses.find(params[:id])
    #@course = Course.find_by_id(params[:id])
  end
  
  def new
    #@course = Course.new
    @course = @department.courses.new
  end
  
  def create
    @department = Department.find(params[:department_id])
    @course = @department.courses.build(params[:course])
    if @course.save
      flash[:notice] = "You have created a new course!"
      redirect_to root_path
    else
      flash[:notice] = "Course not saved"
      render :action => 'new'
    end
  end
  
  def edit
    #@department = Department.find(params[:id])
    #@course = Course.find_by_id(params[:id])
    #@course = Course.find_by_id(params[:id])
    @course = @department.courses.find(params[:id])
  end
  
  def update
    @course = @department.courses.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:notice] = "Course was successfully updated!"
      redirect_to admin_department_path(@department.id)
    else
      flash[:notice] = "Update was not saved!"
      render :action => 'edit'
    end
  end
  
  def destroy
    @course = @department.courses.find(params[:id])
    @course.destroy
    redirect_to admin_department_path(@department.id)
  end
  
  private
  
  def load_department
    @department = Department.find(params[:department_id])
  end
end
