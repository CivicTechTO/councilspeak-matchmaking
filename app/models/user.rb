class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :speakings, class_name: "Deputation", foreign_key: "speaker_id"
  has_many :presentations, class_name: "Deputation", foreign_key: "presenter_id"

  def anonymous?
    false
  end

  def registered?
    true
  end

end

class NullUser
  def anonymous?
    true
  end

  def registered?
    false
  end

  def id
    nil
  end
end
