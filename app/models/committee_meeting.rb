class CommitteeMeeting < ApplicationRecord
  has_many :committee_agenda_items, dependent: :destroy

end
