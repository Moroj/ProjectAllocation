class AddDepartmentIdToAprofiles < ActiveRecord::Migration
  def change
    add_column :aprofiles, :department_id, :integer
  end
end
