class AddColumnToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :rank, :integer
  end
end
