class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :dep_id,  :null => false
      t.string :title

      t.timestamps
    end
    add_index :departments, :dep_id,   :name => 'dep_id_ix',      :unique => true
  end
end
