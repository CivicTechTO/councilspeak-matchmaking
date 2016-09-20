class Deputation < ApplicationRecord
  belongs_to :speaker
  belongs_to :presenter
  belongs_to :agenda_item
end
