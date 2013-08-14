class AddDeliveredAtToAllocs < ActiveRecord::Migration
  def change
    add_column :allocs, :delivered_at, :datetime
  end
end
