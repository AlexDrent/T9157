class AddTroopEventToSignUp < ActiveRecord::Migration[7.1]
  def change
    add_reference :sign_ups, :troop_event, null: false, foreign_key: true
  end
end
