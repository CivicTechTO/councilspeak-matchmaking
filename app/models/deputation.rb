class Deputation < ApplicationRecord
  validates :video_url, presence: true

  belongs_to :speaker, class_name: "User"
  belongs_to :presenter, class_name: "User", optional: true
  belongs_to :agenda_item
end
