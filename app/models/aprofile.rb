class Aprofile < ActiveRecord::Base
  attr_accessible :department, :f_name, :l_name, :urn, :academic_id
  
  belongs_to :academic, :foreign_key => :academic_id
  
  def to_param
    academic_id
  end
  
  def name
    "#{f_name} #{l_name}"
  end
end
