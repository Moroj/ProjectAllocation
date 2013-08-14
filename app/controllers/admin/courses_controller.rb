class Admin::CoursesController < AdminController
  before_filter :load_department
  def index
    @courses = @department.courses.order(:title)
  end
  
  def show
    @course = @department.courses.find(params[:id])
  end
  
  def new
    @course = @department.courses.new
  end
  
  def create
    @department = Department.find(params[:department_id])
    @course = @department.courses.build(params[:course])
    if @course.save
      flash[:notice] = "You have created a new course!"
      redirect_to admin_department_path(@department.id)
    else
      flash[:notice] = "Course not saved"
      #redirect_to admin_dapartment_path(@department.id)
      render :action => 'new'
    end
  end
  
  def edit
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
