class Choice < ActiveRecord::Base
  
  #include RankedModel
  #ranks :row_order
  attr_accessible :student_id, :project_id, :position
  #attr_accessor :project_id
  #:op1, :op2, :op3, :op4, :op5
  belongs_to :student, :foreign_key => :student_id
  acts_as_list scope: :student
  belongs_to :project, :foreign_key => :project_id
  has_one :sprofile, :through => :student
  has_one :academic, :through => :project
  has_one :aprofile, :through => :academic
  #belongs_to :option1, :foreign_key => 'op1', :class_name => "Project"
  #belongs_to :option2, :foreign_key => 'op2', :class_name => "Project"
  #belongs_to :option3, :foreign_key => 'op3', :class_name => "Project"
  #belongs_to :option4, :foreign_key => 'op4', :class_name => "Project"
  #belongs_to :option5, :foreign_key => 'op5', :class_name => "Project"
  
  validates_presence_of :project_id
  validates_uniqueness_of :project_id, :scope => :student_id, :message => "You can select a project only once!"
  validate :choice_count_within_limit, :on => :create
  #validate :options
  #auto_increment :column => :rank, :scope => :student_id, :initial => 1
  #before_validation  do
  #  existing_option = Choice.find(:first, :condition => ["student_id=? AND"])
  #end
  #def options
   # errors[:base] <<'Each project could be selected once only!' unless attributes_unique? :op1, :op2, :op3, :op4, :op5
  #end
  #def attributes_unique?(*attributes)
  #  attributes.size == attributes.collect { |a| self[a] }.uniq.size
  #end
  #def xyz
  #  :option1 != :option2
  #end
  
 # before_validation( :on => :create)  do
 #   self.rank = self.student.choices.collect {|choice| choice.rank }.max + 1
 # end
 
 
     
     
  def choice_count_within_limit
    if self.student.choices(:reload).count >= 5
      errors.add(:base, "Exceeded the number of choices!")
    end
  end
  
  #def option1
   # if :op1 == project.id
  #  "#{op1}"+ self.project.title 
  #end
  # end
  
  def self.get_projects(params)
    conditions = ['']
    conditions = ['projects.academic_id = ?', params[:academic_id]] if params[:academic_id]
    self.where(conditions)
  end
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end

end
