class CreateCommitteeMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :committee_meetings do |t|
      t.date :date

      t.timestamps
    end
  end
end
