class CreateAgendaItems < ActiveRecord::Migration[5.1]
  def change
    create_table :agenda_items do |t|
      t.string :name
      t.references :meeting
      t.references :owner, foreign_key: {to_table: :users}
      t.integer :item_type, default: 1
      t.big_int :duration
      t.integer :order

      t.timestamps
    end
  end
end
