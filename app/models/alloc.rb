class Alloc < ActiveRecord::Base
  attr_accessible :scheduled_at, :delivered_at, :title
  #attr_accessor :scheduled_at, :delivered_at
#  has_many :students
#  has_many :academics
#  has_many :projects
#  has_many :choices
#  has_many :sprofile
  validates_uniqueness_of :title
  def self.next_for_allocation
    alloc = Alloc.first(:conditions => ["delivered_at IS NULL AND scheduled_at <= ?", Time.now], :order => "scheduled_at")
   
    puts "new"
    if alloc
      Alloc.export
      alloc.update_column(:scheduled_at, nil)
      alloc.update_column(:delivered_at, Time.now)
      system 'python /Users/morojalsulaimani/ProjectAllocation/app/views/allocs/allocDB3.py'
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
