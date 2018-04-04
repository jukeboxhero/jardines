class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
