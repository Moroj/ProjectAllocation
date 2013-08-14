class AddPerferanceToChoices < ActiveRecord::Migration
  def change
    add_column :choices, :position, :integer
  end
end
