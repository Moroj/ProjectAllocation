class RemoveAprofileIdFromAprofiles < ActiveRecord::Migration
  def up
    remove_column :aprofiles, :aprofile_id
  end

  def down
    add_column :aprofiles, :aprofile_id, :integer
  end
end
