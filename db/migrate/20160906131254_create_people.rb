class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :family_name
      t.string :lawyer
      t.string :contact_persons

      t.timestamps
    end
  end
end
