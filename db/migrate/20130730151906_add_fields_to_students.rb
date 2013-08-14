class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :allocated_project, :integer, :default => 0
    add_column :students, :allocated_academic, :integer, :default => 0
  end
end
