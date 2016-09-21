class Deputation < ApplicationRecord
  validates :video_url, presence: true

  belongs_to :speaker, class_name: "Person"
  belongs_to :presenter, class_name: "Person", optional: true
  belongs_to :agenda_item
end
