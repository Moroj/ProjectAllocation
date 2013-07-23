class RemoveRankFromChoices < ActiveRecord::Migration
  def up
    remove_column :choices, :rank
  end

  def down
    add_column :choices, :rank, :integer
  end
end
