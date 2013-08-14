class RemoveColumnsFromChoices < ActiveRecord::Migration
  def up
    remove_column :choices, :op1
    remove_column :choices, :op2
    remove_column :choices, :op3
    remove_column :choices, :op4
    remove_column :choices, :op5
    remove_column :choices, :row_order
    remove_column :choices, :allocated_project
    remove_column :choices, :allocated_academic
  end

  def down
    add_column :choices, :allocated_academic, :integer
    add_column :choices, :allocated_project, :integer
    add_column :choices, :row_order, :integer
    add_column :choices, :op5, :integer
    add_column :choices, :op4, :integer
    add_column :choices, :op3, :integer
    add_column :choices, :op2, :integer
    add_column :choices, :op1, :integer
  end
end
