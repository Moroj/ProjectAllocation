class ChoicesController < ApplicationController
  before_filter :authenticate_student!
  
  def index
    @student = current_student
    @choices = @student.choices.order(:position)
  end
  
  def new
    if current_student
     @student = current_student
     @choice = @student.choices.new
    else
      redirect_to student_sign_in_path
    end
  end
  
  def create
    @student = current_student
    project = Project.find_by_id(params[:project_id])
    @choice = @student.choices.build(params[:choice])
    @choice.project = project
    @choice.student_id = current_student.id if current_student
    if @choice.save
      flash[:notice] = "You have added a selection successfully!"
      redirect_to choices_path
    else
      flash[:notice] = "The selection was not saved!"
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
        respond_to do |format|
        format.html {redirect_to(:action => 'edit', :notice => "Update was not saved!")}      
         end
        flash[:notice] = "Update was not saved!"
        render :action => 'edit'
      end
  end
  
  def destroy
      @choice = Choice.find_by_id(params[:id])
      @choice.destroy
      redirect_to choices_path
  end
  
  def sort
    params[:choice].each_with_index do |id, index|
      Choice.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  def update_choices
    department = Department.find_by_id(params[:department_id])
    @projects = department.projects.map{|c| [c.title, c.id]}.insert(0, "Select ")
  end
end
