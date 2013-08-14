class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :n_requested, :integer, :default => 0
    add_column :projects, :n_allocated, :integer, :default => 0
  end
end
