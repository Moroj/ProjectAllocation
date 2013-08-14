class RemoveAllocatedFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :allocated_project
    remove_column :students, :allocated_academic
  end

  def down
    add_column :students, :allocated_academic, :integer
    add_column :students, :allocated_project, :integer
  end
end
