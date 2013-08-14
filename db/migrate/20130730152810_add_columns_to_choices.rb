class AddColumnsToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :op1, :integer
    add_column :choices, :op2, :integer
    add_column :choices, :op3, :integer
    add_column :choices, :op4, :integer
    add_column :choices, :op5, :integer
  end
end
