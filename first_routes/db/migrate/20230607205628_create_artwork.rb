class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, index: true
      t.string :image_url, null: false, index: { unique: true }
      t.integer :artist_id, null: false


      t.timestamps
    end
    add_foreign_key :artworks, :users, column: :artist_id
    add_index :artworks, [:artist_id, :title], unique: true
    # add_index :artworks, :title
    # add_index :artworks, :image_url, unique: true
  end
end
