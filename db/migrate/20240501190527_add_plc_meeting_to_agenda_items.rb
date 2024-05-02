class AddPlcMeetingToAgendaItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :agenda_items, :plc_meeting, null: false, foreign_key: true
  end
end
