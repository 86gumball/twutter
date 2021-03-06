class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id, null: false
    end
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
