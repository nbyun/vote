class AddColumnToPlayerPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :player_pictures, :player_id, :integer
  end
end
