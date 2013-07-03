class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      
      t.integer :dep_id,  :null => false
      t.integer :course_id, :null => false
      t.string :title
      
      
      t.timestamps
    end
    add_index :courses, [:dep_id, :course_id], :name => 'dep_course_ix', :unique => true
  end
end
