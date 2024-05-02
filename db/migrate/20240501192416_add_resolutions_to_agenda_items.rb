class AddResolutionsToAgendaItems < ActiveRecord::Migration[7.1]
  def change
    add_column :agenda_items, :resolutions, :text
  end
end
