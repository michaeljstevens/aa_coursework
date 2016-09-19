class CreateTaggins < ActiveRecord::Migration
  def change
    create_table :taggins do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
