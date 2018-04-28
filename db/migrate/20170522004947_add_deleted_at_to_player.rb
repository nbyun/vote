class AddDeletedAtToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :deleted_at, :datetime
  end
end
