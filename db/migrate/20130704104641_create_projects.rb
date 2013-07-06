class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :academic_id
      t.string :number
      t.string :title
      t.text :description
      t.text :requirements
      t.text :resources
      t.integer :total_students

      t.timestamps
    end
  end
end
