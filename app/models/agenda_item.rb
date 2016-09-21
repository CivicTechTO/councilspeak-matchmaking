class AgendaItem < ApplicationRecord
  validates :identifier, presence: true
  validates :title, presence: true
  validates :meeting_date, presence: true
  validates :organization, presence: true

  has_many :deputations
end
