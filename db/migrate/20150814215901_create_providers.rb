class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :type
      t.string :name
      t.integer :sequence_number
      t.timestamps null: false
    end
  end
end
