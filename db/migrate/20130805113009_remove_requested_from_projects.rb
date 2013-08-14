class RemoveRequestedFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :n_requested
    remove_column :projects, :n_allocated
  end

  def down
    add_column :projects, :n_allocated, :integer
    add_column :projects, :n_requested, :integer
  end
end
