class AddColumnToAprofiles < ActiveRecord::Migration
  def change
    add_column :aprofiles, :students_to_supervise, :integer
  end
end
