class AddTagsToCards < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :taggable, polymorphic: true
      t.references :tag, foreign_key: true
    end

    add_index :tags, :name, unique: true
    add_index :taggings, [:taggable_id, :tag_id]
    add_index :taggings, [:tag_id, :taggable_id]
  end
end
