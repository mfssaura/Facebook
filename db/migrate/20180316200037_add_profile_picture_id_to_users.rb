class AddProfilePictureIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture_id, :integer, default: nil
  end
end
