class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :album
      t.integer :rating
      
      t.timestamps null: false
    end
  end
end
