class CreateBangkus < ActiveRecord::Migration[5.2]
  def change
    create_table :bangkus do |t|
      t.integer :no_bangku
      t.string :keterangan
      t.belongs_to :bus, foreign_key: true
      t.belongs_to :jadwal, foreign_key: true
      
      t.timestamps
    end
  end
end
