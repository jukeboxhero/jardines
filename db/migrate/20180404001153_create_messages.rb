class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :author_id, foreign_key: {to_table: :users}, null: false
      t.string :subject, null: false
      t.string :body, null: false
      t.references :parent_id, foreign_key: {to_table: :messages}
      t.references :messagable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
