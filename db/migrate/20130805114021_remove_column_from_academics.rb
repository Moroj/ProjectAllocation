class RemoveColumnFromAcademics < ActiveRecord::Migration
  def up
    remove_column :academics, :n_allocated
  end

  def down
    add_column :academics, :n_allocated, :integer
  end
end
