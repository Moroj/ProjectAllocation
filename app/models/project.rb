class Project < ActiveRecord::Base
  attr_accessible :academic_id, :description, :number, :requirements, :resources, :title, :total_students
  
  belongs_to :academic, :foreign_key => :academic_id
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
 
  def self.get_projects(params)
    conditions = ['']
    conditions = ['projects.academic_id = ?', params[:academic_id]] if params[:academic_id]
    self.where(conditions)
  end
  
end
