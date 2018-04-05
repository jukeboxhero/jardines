class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :owner_id, foreign_key: {to_table: :users}
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
