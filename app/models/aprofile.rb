class Aprofile < ActiveRecord::Base
  attr_accessible :aprofile_id, :department, :f_name, :l_name, :urn
  
  belongs_to :academic
  
  def to_param
    aprofile_id
  end
  
  def name
    "#{f_name} #{l_name}"
  end
end
