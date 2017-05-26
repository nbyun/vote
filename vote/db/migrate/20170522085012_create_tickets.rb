class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.column :ip_address, :string
      t.column :player_id, :integer
      t.column :host_name, :string
      t.timestamps
    end
  end
end
