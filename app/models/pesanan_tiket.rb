class PesananTiket < ApplicationRecord
  belongs_to :bangku
  belongs_to :jadwal

  validates :nama_pen, presence: true
  validates :no_telp, presence: true
  validates :alamat, presence: true
  validates :status_pem, presence: true
  validates :jmlh_pem, presence: true
end
