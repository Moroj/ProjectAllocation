class AddIdToAprofiles < ActiveRecord::Migration
  def change
    add_column :aprofiles, :academic_id, :integer
  end
end
