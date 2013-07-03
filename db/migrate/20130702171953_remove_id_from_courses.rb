class RemoveIdFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :dep_id
  end

  def down
    add_column :courses, :dep_id, :integer
  end
end
