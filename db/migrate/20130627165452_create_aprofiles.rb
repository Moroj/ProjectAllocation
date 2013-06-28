class CreateAprofiles < ActiveRecord::Migration
  def change
    create_table :aprofiles do |t|
      t.integer :aprofile_id, :null => false
      t.integer :urn
      t.string :f_name
      t.string :l_name
      t.string :department

      t.timestamps
    end
    add_index :aprofiles, :urn,   :name => 'aprofiles_urn_ix',             :unique => true
  end
end
