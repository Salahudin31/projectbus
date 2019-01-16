class CreatePesananTikets < ActiveRecord::Migration[5.2]
  def change
    create_table :pesanan_tikets do |t|
      t.string :nama_pen
      t.string :no_telp
      t.string :alamat
      t.string :status_pem
      t.integer :jumlah_pem
      t.belongs_to :bangku, foreign_key: true
      t.belongs_to :jadwal, foreign_key: true


      t.timestamps
    end
  end
end
