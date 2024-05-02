class PlcMeeting < ApplicationRecord
  has_many :agenda_items, dependent: :destroy
end
