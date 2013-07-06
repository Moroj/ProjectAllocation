class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :sprofiles, :department, :department_id
  end

  def down
  end
end
