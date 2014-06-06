class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.timestamps null: false

      t.string :first_name,      null: false
      t.string :last_name,       null: false, default: ''
      t.string :email,           null: false, default: ''
      t.string :secondary_email, null: false, default: ''
      t.string :company,         null: false, default: ''
      t.text   :notes,           null: false, default: ''
      t.string :slug,            null: false
    end
    add_index :contacts, :slug, unique: true
  end
end
