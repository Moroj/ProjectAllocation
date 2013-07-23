class Choice < ActiveRecord::Base
  attr_accessible :project_id, :student_id, :rank
  belongs_to :student, :foreign_key => :student_id, :inverse_of => :choices
  belongs_to :project, :foreign_key => :project_id, :inverse_of => :choices
  
  validates_presence_of :project_id
  validates_uniqueness_of :project_id, :scope => :student_id
  validate :choice_count_within_limit, :on => :create
  
  auto_increment :column => :rank, :scope => :student_id, :initial => 1
  
  
  
 # before_validation( :on => :create)  do
 #   self.rank = self.student.choices.collect {|choice| choice.rank }.max + 1
 # end
 
  def choice_count_within_limit
    if self.student.choices(:reload).count >= 5
      errors.add(:base, "Exceeded the number of choices!")
    end
  end
  
  def self.get_projects(params)
    conditions = ['']
    conditions = ['projects.academic_id = ?', params[:academic_id]] if params[:academic_id]
    self.where(conditions)
  end
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end

end
