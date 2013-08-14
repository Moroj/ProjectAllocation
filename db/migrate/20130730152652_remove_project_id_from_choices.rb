class RemoveProjectIdFromChoices < ActiveRecord::Migration
  def up
    remove_column :choices, :project_id
  end

  def down
    add_column :choices, :project_id, :integer
  end
end
