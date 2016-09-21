class Deputation < ApplicationRecord
  validates :video_url, presence: true

  belongs_to :speaker, class_name: "Speaker"
  belongs_to :presenter, class_name: "Presenter", optional: true
  belongs_to :agenda_item
end
