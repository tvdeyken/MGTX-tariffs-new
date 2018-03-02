class CreateTariffs < ActiveRecord::Migration[5.1]
  def change
    create_table :tariffs do |t|
      t.string :country
      t.string :zip
      t.integer :weight
      t.string :price
      t.string :carrier
      t.string :expire
      t.string :transit_time
      t.string :loading_region

      t.timestamps
    end
  end
end
