class ChoicesController < ApplicationController
  before_filter :authenticate_student!
  
  def index
    @student = current_student
    @choices = @student.choices.find(:all)
    @choices.project_id = @project.id
    
  end
  
  def new
    if current_student
     @student = current_student
     @choice = @student.choices.new
     @departments = Department.order(:title)
     @projects = Project.find(:all, :joins => "LEFT JOIN 'aprofiles' ON projects.academic_id = aprofiles.academic_id")
    else
      redirect_to student_sign_in_path
    end
  end
  
  def create
    @student = current_student
    project = Project.find(params[:project_id])
    @departments = Department.order(:title)
    @projects = Project.find(:all, :joins => "LEFT JOIN 'aprofiles' ON projects.academic_id = aprofiles.academic_id")
    @choice = @student.choices.build(params[:choice])
    @choice.project = project
    @choice.student_id = current_student.id if current_student
    if @choice.save
      flash[:notice] = "You have added a choice successfully!"
      redirect_to project_list_path
    else
      flash[:notice] = "The choice was not saved! Either you have selected this project before or you have exceeded the number of choices."
      redirect_to project_list_path
    end
  end

  
  def show
    @choice = Choice.find_by_id(params[:id])
  end
  
  def edit
    @projects = Project.get_projects(params).order(:title)
    @choice = Choice.find_by_id(params[:id])
    
    @departments = Department.order(:title)
    @projects = Project.find(:all, :joins => "LEFT JOIN 'aprofiles' ON projects.academic_id = aprofiles.academic_id")
   
  end
  
  def update
    @choice = Choice.find_by_id(params[:id])
    project = Project.find(params[:project_id])
    @choice.project = project
    @departments = Department.order(:title)
    @projects = Project.find(:all, :joins => "LEFT JOIN 'aprofiles' ON projects.academic_id = aprofiles.academic_id")
    if @choice.update_attributes(params[:choice])
       flash[:notice] = "Choice was successfully updated!"
        redirect_to choices_path
      else
        flash[:notice] = "Update was not saved!"
        render :action => 'edit'
      end
  end
  
  def destroy
     @choice = Choice.find_by_id(params[:id])
      @choice.destroy
      redirect_to choices_path
  end
  
  
  def update_choices
    department = Department.find_by_id(params[:department_id])
    @projects = department.projects.map{|c| [c.title, c.id]}.insert(0, "Select ")
  end
end
