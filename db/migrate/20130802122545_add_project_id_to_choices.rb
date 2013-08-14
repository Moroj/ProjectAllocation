class AddProjectIdToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :project_id, :integer
  end
end
