class RemoveCourseIdFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :course_id
  end

  def down
    add_column :courses, :course_id, :integer
  end
end
