class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :proposal_id, foreign_key: true
      t.references :user_id, foreign_key: true
      t.references :residence_id, foreign_key: true
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
