class Choice < ActiveRecord::Base
  attr_accessible :student_id, :project_id, :position
  belongs_to :student, :foreign_key => :student_id
  acts_as_list scope: :student
  belongs_to :project, :foreign_key => :project_id
  has_one :sprofile, :through => :student
  has_one :academic, :through => :project
  has_one :aprofile, :through => :academic
  validates_presence_of :project_id
  validates_uniqueness_of :project_id, :scope => :student_id, :message => "You can select a project only once!"
  validate :choice_count_within_limit, :on => :create
  
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
