class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.string :file
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
