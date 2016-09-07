class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :s_n, null: false
      t.integer :register_number, null: false
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :lawyer, null: false
      t.string :contact_persons

      t.timestamps
    end
  end
end
