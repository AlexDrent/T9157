class AddCommitteMeetingToCommitteeAgendaItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :committee_agenda_items, :committee_meeting, null: false, foreign_key: true
  end
end
