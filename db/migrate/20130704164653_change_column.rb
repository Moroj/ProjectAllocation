class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :sprofiles, :department, :integer
  end

  def down
    change_column :sprofiles, :department, :string
  end
end
