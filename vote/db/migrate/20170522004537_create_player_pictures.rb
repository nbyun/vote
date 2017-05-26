class CreatePlayerPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :player_pictures do |t|
      t.attachment :image
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
