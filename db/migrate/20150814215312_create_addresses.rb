class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :point
      t.references :provider
      t.string :street
      t.string :city
      t.string :region
      t.string :country
      t.timestamps null: false
    end
  end
end
