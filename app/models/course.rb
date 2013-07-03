class Course < ActiveRecord::Base
   attr_accessible :title, :department_id
   belongs_to :department
  
   
   validates_presence_of  :title,  :presence => {:message => 'Please fill all fields.'}
   
   def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
   end
   
end
