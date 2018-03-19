class RemovePictureFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :picture
  end
end
