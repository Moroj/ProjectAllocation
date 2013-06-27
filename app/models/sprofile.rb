class Sprofile < ActiveRecord::Base
  attr_accessible :course, :degree, :department, :f_name, :l_name, :sprofile_id, :urn
  
  belongs_to :student
  
  def to_param
    sprofile_id
  end
  
  def name
    "#{f_name} #{l_name}"
  end
  
  
end