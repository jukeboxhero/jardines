class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.string :name, null: false
      t.references :image_id, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
