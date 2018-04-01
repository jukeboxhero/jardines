class CreateMeetings < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :name, null: false
      t.string :location
      t.datetime :meeting_time
      t.string :description
      t.references :chairperson, foreign_key: {to_table: :users}
      t.references :minutetaker, foreign_key: {to_table: :users}
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
