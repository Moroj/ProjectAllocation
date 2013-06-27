class CreateSprofiles < ActiveRecord::Migration
  def change
    create_table :sprofiles do |t|
      t.integer :sprofile_id,   :null => false
      t.integer :urn
      t.string :f_name
      t.string :l_name
      t.string :degree
      t.string :course
      t.string :department

      t.timestamps
    end
    add_index :sprofiles, :urn,   :name => 'sprofiles_urn_ix',             :unique => true
  end
end
