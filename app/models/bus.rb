class Bus < ApplicationRecord
	has_many :bangkus

	validates :no_bus, presence: true
	validates :jenis_bus, presence: true
	validates :jumlah_b, presence: true
	validates :fasilitas, presence: true
end
