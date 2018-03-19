class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.integer :friend_id, null: false
      t.integer :accepted, null: false, default: 0
      t.timestamps null: false
    end
  end
end
