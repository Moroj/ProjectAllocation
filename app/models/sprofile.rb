class Sprofile < ActiveRecord::Base
  attr_accessible :course_id, :degree, :department_id, :f_name, :l_name, :urn, :student_id
  
  belongs_to :student, :foreign_key => :student_id
  belongs_to :department, :foreign_key => :department_id
  belongs_to :course, :foreign_key => :course_id
  
  validates_uniqueness_of :urn
  validates_presence_of :course_id, :degree, :department_id, :f_name, :l_name, :urn
  
  def to_param
    student_id
  end
  
  def name
    "#{l_name}, #{f_name} "
  end
  
  def select(object, method, choices, options = {}, html_options = {})
  end
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
end