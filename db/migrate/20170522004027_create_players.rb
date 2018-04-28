class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.column :name, :string
      t.column :nickname, :string
      t.column :description, :text
      t.column :display, :integer
      t.timestamps
    end
  end
end
