class Course < ActiveRecord::Base
   before_save :capitalize_title
   attr_accessible :title, :department_id
   belongs_to :department, :foreign_key => :department_id
   has_many :sprofiles
  
   validates_uniqueness_of :title
   validates_presence_of  :title,  :presence => {:message => 'Please fill all fields.'}
   
   def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
   end
   
   def capitalize_title
     self.title = self.title.titleize
   end
   
end
