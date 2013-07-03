class RemoveIdFromDepartments < ActiveRecord::Migration
  def up
    remove_column :departments, :dep_id
  end

  def down
    add_column :departments, :dep_id, :integer
  end
end
