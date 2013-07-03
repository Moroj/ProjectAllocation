class Sprofile < ActiveRecord::Base
  attr_accessible :course, :degree, :department, :f_name, :l_name, :urn, :student_id
  
  belongs_to :student, :foreign_key => :student_id
  
  def to_param
    student_id
  end
  
  def name
    "#{f_name} #{l_name}"
  end
  
  def select(object, method, choices, options = {}, html_options = {})
  end
end