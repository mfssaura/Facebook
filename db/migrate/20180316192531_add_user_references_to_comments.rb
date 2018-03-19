class AddUserReferencesToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :user, foreign_key: true
  end
end
