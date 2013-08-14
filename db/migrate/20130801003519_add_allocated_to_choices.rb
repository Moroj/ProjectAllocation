class AddAllocatedToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :allocated_project, :integer, :default => 0
    add_column :choices, :allocated_academic, :integer, :default => 0
  end
end
