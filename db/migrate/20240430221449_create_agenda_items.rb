class CreateAgendaItems < ActiveRecord::Migration[7.1]
  def change
    create_table :agenda_items do |t|
      t.text :subject
      t.text :details
      t.boolean :done

      t.timestamps
    end
  end
end
