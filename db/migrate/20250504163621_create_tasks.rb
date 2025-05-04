class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :due_at
      t.datetime :done_at

      t.timestamps
    end
  end
end
