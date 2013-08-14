class CreateAllocs < ActiveRecord::Migration
  def change
    create_table :allocs do |t|
      t.integer :student_id
      t.integer :project_id
      t.integer :academic_id
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
