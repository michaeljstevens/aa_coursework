class CreateContactShares < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, :null => false
      t.integer :user_id, :null => false
      t.timestamps null: false
    end
    add_index(:contact_shares, [:user_id, :contact_id], unique: true)
    change_column :contacts, :user_id, :integer
  end
end
