class ProjectsController < ApplicationController
  before_filter :authenticate_academic!, :except => [:list, :show]
  

  def index
    @projects = Project.where(academic_id: current_academic.id).find(:all)
  end
  
  def show
    @project = Project.find_by_id(params[:id])
  end
  
  def new
    @project = Project.new
    @project.academic_id = current_academic.id
  end
  
  def create
    @project = Project.new(params[:project])
    @project.academic_id = current_academic.id
    if @project.save
      flash[:notice] = "You have created a project successfully!"
      redirect_to projects_path
    else
      flash[:notice] = "Project not saved"
      render :action => 'new'
    end
  end
  
  def edit
    @project = Project.find_by_id(params[:id])
    @project.academic_id = current_academic.id
  end
  
  def update
    @project = Project.find_by_id(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "The project was successfully updated!"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Update was not saved."
      render :action => 'edit'
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  
  def list
    @projects = Project.get_projects(params).order(:title)
    @choice = Choice.new
    respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @projects }
          format.js
        end
  end
  
end
