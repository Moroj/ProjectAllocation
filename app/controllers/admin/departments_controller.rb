class Admin::DepartmentsController < AdminController
  
  def index
    @departments = Department.find(:all)
  end
  
  def show
    @department = Department.find_by_id(params[:id])
  end
  
  def new
    @department = Department.new
  end
  
  def create
    @department = Department.new(params[:department])
    if @department.save
      flash[:notice] = "You have created a new department!"
      redirect_to root_path
    else
      flash[:notice] = "Department not saved"
      render :action => 'new'
    end
  end
  
  def edit
    @department = Department.find(params[:id])
  end
  
  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(params[:department])
      flash[:notice] = "Department was successfully updated."
      redirect_to admin_departments_path
    else
      flash[:notice] = "Update was not saved."
      render :action => 'edit'
    end
  end
  
  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    redirect_to admin_departments_path
  end
end
