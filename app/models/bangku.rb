class Bangku < ApplicationRecord
  belongs_to :bus
  belongs_to :jadwal

  validates :no_bangku, presence: true
  validates :keterangan, presence: true
end
