class CreateServants < ActiveRecord::Migration[5.0]
  def change
    create_table :servant_classes do |t|
      t.string :name
    end

    create_table :servants do |t|
      t.integer :official_id
      t.string :name
      t.integer :rarity
      t.references :servant_class, foreign_key: true

      t.timestamps
    end
  end
end
