class Rute < ApplicationRecord
	has_many :jadwals

	validates :start, presence: true
	validates :end, presence: true
end
