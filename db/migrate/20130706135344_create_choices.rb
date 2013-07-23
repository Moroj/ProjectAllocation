class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :student_id
      t.integer :academic_id
      t.integer :project_id

      t.timestamps
    end
  end
end
