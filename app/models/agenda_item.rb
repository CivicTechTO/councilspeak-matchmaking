class AgendaItem < ApplicationRecord
  validates :identifier, presence: true
  validates :title, presence: true
  validates :meeting_date, presence: true
  validates :organization, presence: true

  has_many :deputations

  rails_admin do
    object_label_method do
      :reference_name
    end
  end

  def reference_name
    "#{self.identifier}: #{self.title}"
  end

end
