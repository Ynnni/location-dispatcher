class AddLocationIdToPoints < ActiveRecord::Migration
  def change
    add_column :points, :location_id, :integer
  end
end
