class AddNAllocatedToAcademics < ActiveRecord::Migration
  def change
    add_column :academics, :n_allocated, :integer, :default => 0
  end
end
