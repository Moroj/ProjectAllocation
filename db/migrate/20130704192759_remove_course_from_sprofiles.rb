class RemoveCourseFromSprofiles < ActiveRecord::Migration
  def up
    remove_column :sprofiles, :course
  end

  def down
    add_column :sprofiles, :course, :string
  end
end
