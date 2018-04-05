class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.string :address, null: false
      t.integer :square_footage

      t.timestamps
    end
  end
end
