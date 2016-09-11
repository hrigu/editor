class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.string :author, null: false
      t.references :person, null: false
      t.references :user, null: false

      t.timestamps
    end

    # funktioniert nicht in sqlite
    add_foreign_key :comments, :people, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade

  end
end
