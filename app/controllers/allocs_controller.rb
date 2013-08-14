class AllocsController < ApplicationController
  before_filter :authenticate_admin!
    
  def index
    @allocs = Alloc.find(:all)
    
   # @allocs = Student.find(:all, :joins => "LEFT JOIN 'choices' ON student_id = choices.student_id, LEFT JOIN 'projects' ON choices.project_id = project.id, LEFT JOIN 'academics' ON projects.academic_id = academic.id")
  end
  
  def show
    @choices = Choice.all(:include => [:student, :sprofile, :project, :academic, :aprofile])
    CSV.open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/results.csv", "w") do |csv|
        csv << ["URN", "S Name", "Choices", "P capacity", "A Name", "A Capacity"]
         @choices.each do |s|
               csv << [s.sprofile.urn, s.sprofile.name, s.project.title, s.project.total_students, s.aprofile.name, s.aprofile.students_to_supervise]
           end
        end
    
    respond_to do |format|
      format.html
      #format.csv { send_data @choices.to_csv}
    end
    
  end
  
  def export
    @choices = Choice.all(:include => [:student, :sprofile, :project, :academic, :aprofile])
    csv = CSV.open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/inputs.csv", "w") do |csv|
        #csv << ["Student_id", "C_Weight", "Choice", "P_Capacity", "Academic_id", "A_Capacity"]
         @choices.each do |s|
               csv << [s.student_id, s.position, s.project_id, s.project.total_students, s.project.academic_id, s.aprofile.students_to_supervise]
           end
        end
    
    redirect_to allocs_path
  end
  
  def new
    @alloc = Alloc.new
  end
  
  def create 
    @alloc = Alloc.new(params[:alloc])
    if @alloc.save
      flash[:notice] = "Successfully completed."
      redirect_to allocs_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @alloc = Alloc.find(params[:id])
  end
  
  def update
    @alloc = Alloc.find(params[:id])
    if @alloc.update_attributes(params[:alloc])
      flash[:notice] = "Successfully updated."
      redirect_to @alloc
      else
      render :action => 'edit'
    end
  end
      
  def destroy
    @alloc = Alloc.find_by_id(params[:id])
    @alloc.destroy
    flash[:notice] = "Successfully destroyed."
    redirect_to allocs_path
  end
end
