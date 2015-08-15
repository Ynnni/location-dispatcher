class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :symbol
      t.integer :sequence_number
      t.timestamps null: false
    end
  end
end
