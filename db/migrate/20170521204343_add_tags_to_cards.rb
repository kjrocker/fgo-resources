class AddTagsToCards < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :card_tags do |t|
      t.references :card, foreign_key: true
      t.references :tag, foreign_key: true
    end

    add_index :tags, :name, unique: true
    add_index :card_tags, [:card_id, :tag_id]
    add_index :card_tags, [:tag_id, :card_id]
  end
end
