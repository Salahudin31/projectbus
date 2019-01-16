class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :no_bus
      t.string :jenis_bus
      t.integer :jumlah_bus
      t.string :fasiitas

      t.timestamps
    end
  end
end
