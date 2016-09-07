class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.string :author, null: false
      t.references :person, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
