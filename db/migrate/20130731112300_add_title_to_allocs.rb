class AddTitleToAllocs < ActiveRecord::Migration
  def change
    add_column :allocs, :title, :string
  end
end
