class AddIdToSprofiles < ActiveRecord::Migration
  def change
    add_column :sprofiles, :student_id, :integer
  end
end
