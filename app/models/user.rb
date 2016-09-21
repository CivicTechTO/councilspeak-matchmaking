class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :speakings, class_name: "Deputation", foreign_key: "speaker_id"
  has_many :presentations, class_name: "Deputation", foreign_key: "presenter_id"
end
