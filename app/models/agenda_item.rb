class AgendaItem < ApplicationRecord
  validates :identifier, presence: true
  validates :title, presence: true
  validates :meeting_date, presence: true
  validates :organization, presence: true

  validates_uniqueness_of :identifier, scope: :meeting_date

  has_many :deputations

  def self.upcoming
    where('meeting_date >= ?', Date.today)
  end

  def self.search(term)
    where("title LIKE ? OR identifier LIKE ? OR organization LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")
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
