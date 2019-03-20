class AddAvatarToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :avatar, :string
  end
end
