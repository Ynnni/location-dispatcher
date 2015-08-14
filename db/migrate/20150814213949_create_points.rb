class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :latitude
      t.string :longitude
      t.timestamps null: false
    end
  end
end
