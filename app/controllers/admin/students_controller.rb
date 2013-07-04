class Admin::StudentsController < AdminController
 # before_filter :load_sprofile

  def index
    @students = Student.all(:include => :sprofile)
  end
  
  def new 
    @student = Student.new
  end
  
  def create
    @student = Student.new
    @student.accessible = :all if admin_signed_in?
    @student.attributes =  params[:student]
    
    if @student.save
      redirect_to admin_students_path
    else
      render :action => "new"
    end
  end
  
  def destroy
    @student = Student.find_by_id(params[:id])
    @sprofile = Sprofile.find_by_student_id(params[:id])
    @student.destroy
    redirect_to admin_students_path
  end
  
  private
  
  def load_sprofile
    @sprofile = Sprofile.find_by_id(params[:id])
  end
end
