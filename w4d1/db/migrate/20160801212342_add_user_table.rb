class AddUserTable < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.text :username, null: false
      t.timestamps null: false
    end
  end
end
