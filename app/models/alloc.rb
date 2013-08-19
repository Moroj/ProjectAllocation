class Alloc < ActiveRecord::Base
  attr_accessible :scheduled_at, :delivered_at, :title
  before_save :capitalize_title
  validates_uniqueness_of :title
  validates_presence_of :title
  
  def capitalize_title
     self.title = self.title.titleize
   end
   
   
  def self.next_for_allocation
    alloc = Alloc.first(:conditions => ["delivered_at IS NULL AND scheduled_at <= ?", Time.now], :order => "scheduled_at")
    puts "new"
    if alloc
      Alloc.export
      system 'python /Users/morojalsulaimani/ProjectAllocation/app/views/allocs/allocDB3.py'
      alloc.update_column(:scheduled_at, nil)
      alloc.update_column(:delivered_at, Time.now)
      puts "!"
      end
    end
  
    def self.export
      @choices = Choice.all(:include => [:student, :sprofile, :project, :academic, :aprofile])
      csv = CSV.open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/inputs.csv", "w") do |csv|
         # csv << ["Student_id", "C_Weight", "Choice", "P_Capacity", "Academic_id", "A_Capacity"]
           @choices.each do |s|
                 csv << [s.student_id, s.position, s.project_id, s.project.total_students, s.project.academic_id, s.aprofile.students_to_supervise]
             end
          end
        end
  
end
