class Aprofile < ActiveRecord::Base
  before_save :capitalize_name
  attr_accessible :department_id, :f_name, :l_name, :urn, :academic_id, :students_to_supervise
  belongs_to :academic, :foreign_key => :academic_id
  belongs_to :department, :foreign_key => :department_id
  validates_uniqueness_of :urn
  validates_presence_of :department_id, :f_name, :l_name, :urn
  
  def to_param
    academic_id
  end
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
   
  def name
    "#{l_name}, #{f_name}"
  end
  
  def name_project
    "#{self.name}, #{self.academic.title}"
  end
  
  def capitalize_name
    self.l_name.capitalize!
    self.f_name.capitalize!
  end
end
