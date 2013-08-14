class Project < ActiveRecord::Base
  attr_accessible :academic_id, :description, :number, :requirements, :resources, :title, :total_students
  belongs_to :academic, :foreign_key => :academic_id
  has_many :choices
  accepts_nested_attributes_for :choices
  
  #has_many :occurences, :as => 'option1', :foreign_key => 'op1', :class_name => "Choice" 
  #has_many :occurences, :as => 'option2', :foreign_key => 'op2', :class_name => "Choice"
  #has_many :occurences, :as => 'option3', :foreign_key => 'op3', :class_name => "Choice"
  #has_many :occurences, :as => 'option4', :foreign_key => 'op4', :class_name => "Choice"
  #has_many :occurences, :as => 'option5', :foreign_key => 'op5', :class_name => "Choice"
 
  validates_presence_of :description, :number, :requirements, :resources, :title, :total_students
  validates_uniqueness_of :number, :title
  belongs_to :alloc
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
 
  def self.get_projects(params)
    conditions = ['']
    conditions = ['projects.academic_id = ?', params[:academic_id]] if params[:academic_id]
    self.where(conditions)
  end
  
end
