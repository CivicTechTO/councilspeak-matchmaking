class Deputation < ApplicationRecord
  validates :video_url, presence: true

  belongs_to :speaker, foreign_type: "Deputation", class_name: "Speaker"
  belongs_to :presenter, foreign_type: "Deputation", class_name: "Presenter", optional: true
  belongs_to :agenda_item

  rails_admin do
    object_label_method do
      :reference_name
    end
  end

  def reference_name
    "#{self.agenda_item.identifier} on behalf of #{self.speaker.name} (#{self.agenda_item.meeting_date.strftime('%b %e, %Y')})"
  end

end
