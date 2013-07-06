class Aprofile < ActiveRecord::Base
  attr_accessible :department_id, :f_name, :l_name, :urn, :academic_id
  belongs_to :academic, :foreign_key => :academic_id
  belongs_to :department, :foreign_key => :department_id
  
  def to_param
    academic_id
  end
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
   
  def name
    "#{l_name}, #{f_name}"
  end
end
