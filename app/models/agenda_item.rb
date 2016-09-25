class AgendaItem < ApplicationRecord
  attr_accessor :upcoming_date

  validates :identifier, presence: true
  validates :title, presence: true
  validates :meeting_date, presence: true
  validates :organization, presence: true

  validates_uniqueness_of :identifier, scope: :meeting_date

  has_many :deputations

  def attributes
    # Ensure non-persistent field renders in JSON response
    super.merge(upcoming_date: self.upcoming_date)
  end

  def upcoming_date
    self.meeting_date.strftime('%a %b %_d')
  end

  def self.upcoming
    where('meeting_date >= ?', Date.today)
  end

  def self.search(term)
    # Ensure case-insensitive for SQLite3 and PostgreSQL
    term = term.downcase
    where("lower(title) LIKE ? OR lower(identifier) LIKE ? OR lower(organization) LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")
  end

  rails_admin do
    object_label_method do
      :reference_name
    end
  end

  def reference_name
    "#{self.identifier}: #{self.title}"
  end

end
