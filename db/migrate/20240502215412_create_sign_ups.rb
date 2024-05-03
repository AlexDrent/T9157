class CreateSignUps < ActiveRecord::Migration[7.1]
  def change
    create_table :sign_ups do |t|
      t.text :first_name
      t.text :last_name
      t.boolean :paided

      t.timestamps
    end
  end
end
