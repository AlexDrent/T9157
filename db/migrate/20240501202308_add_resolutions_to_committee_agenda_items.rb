class AddResolutionsToCommitteeAgendaItems < ActiveRecord::Migration[7.1]
  def change
    add_column :committee_agenda_items, :resolutions, :text
  end
end
