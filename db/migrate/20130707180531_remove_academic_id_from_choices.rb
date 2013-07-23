class RemoveAcademicIdFromChoices < ActiveRecord::Migration
  def up
    remove_column :choices, :academic_id
  end

  def down
    add_column :choices, :academic_id, :integer
  end
end
