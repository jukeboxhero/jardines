class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.references :notable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
