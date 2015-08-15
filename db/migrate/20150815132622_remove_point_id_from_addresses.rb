class RemovePointIdFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :point_id
  end
end
