class AddCourseIdToSprofiles < ActiveRecord::Migration
  def change
    add_column :sprofiles, :course_id, :integer
  end
end
