class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    add_index :comments, [:question_id, :user_id]
  end
end
