class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.text :user_id, null:false
      t.timestamps null: false
    end
    add_index(:contacts, [:user_id, :email], unique: true)
  end
end
