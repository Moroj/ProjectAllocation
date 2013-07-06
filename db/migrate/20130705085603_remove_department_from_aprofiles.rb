class RemoveDepartmentFromAprofiles < ActiveRecord::Migration
  def up
    remove_column :aprofiles, :department
  end

  def down
    add_column :aprofiles, :department, :string
  end
end
