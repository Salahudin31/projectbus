class Jadwal < ApplicationRecord
  belongs_to :bus
  belongs_to :rute

  validates :tgl_b, presence: true
  validates :jam_b, presence: true
  validates :status_bangku, presence: true
end
