class RemoveSprofileIdFromSprofiles < ActiveRecord::Migration
  def up
    remove_column :sprofiles, :sprofile_id
  end

  def down
    add_column :sprofiles, :sprofile_id, :integer
  end
end
