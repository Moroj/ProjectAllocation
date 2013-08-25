class Alloc < ActiveRecord::Base
  attr_accessible :scheduled_at, :delivered_at, :title
  before_save :capitalize_title
  validates_uniqueness_of :title
  validates_presence_of :title, :scheduled_at
  #validates_presence_of 
  def capitalize_title
     self.title = self.title.titleize
   end
   
   
  def self.next_for_allocation
    alloc = Alloc.first(:conditions => ["delivered_at IS NULL AND scheduled_at <= ?", Time.now], :order => "scheduled_at")
    puts "new"
    if alloc
      Alloc.export
      system Rails.root.join( "app", "views", "allocs", "allocDB3.py").to_s
      alloc.update_column(:scheduled_at, nil)
      alloc.update_column(:delivered_at, Time.now)
      puts "!"
      end
    end
  
    def self.export
      @choices = Choice.all(:include => [:student, :sprofile, :project, :academic, :aprofile])
      csv = CSV.open(Rails.root.join("app", "views", "allocs", "inputs.csv").to_s, "w") do |csv|
        @choices.each do |s|
          csv << [s.sprofile.name, s.position, s.project.number, s.project.total_students, s.project.academic.aprofile.name, s.aprofile.students_to_supervise]
        end
      end
    end
  
end
