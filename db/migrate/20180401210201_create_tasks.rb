class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :taskable, polymorphic: true, index: true
      t.string :title,  null: false
      t.string :description, null: false
      t.datetime :due_date
      t.boolean :send_reminder, default: false
      t.datetime :reminder_time_in_advance

      t.timestamps
    end
  end
end
