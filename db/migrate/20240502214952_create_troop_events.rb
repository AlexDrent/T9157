class CreateTroopEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :troop_events do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.text :title
      t.text :location
      t.float :cost
      t.text :description

      t.timestamps
    end
  end
end
