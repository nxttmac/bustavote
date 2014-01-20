class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :choice_id
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
    add_index :votes, [:question_id, :choice_id, :user_id]
  end
end
