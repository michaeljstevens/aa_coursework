class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :site_id

      t.timestamps null: false
    end

    add_index :taggings, [:tag_id, :site_id]
  end
end
