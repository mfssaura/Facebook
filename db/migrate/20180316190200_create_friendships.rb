class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :friend_id, null: false
      t.timestamps null: false
    end
  end
end
