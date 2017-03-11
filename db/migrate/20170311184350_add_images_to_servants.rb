class AddImagesToServants < ActiveRecord::Migration[5.0]
  def change
    # Prepare Servants Table for STI
    rename_table :servants, :cards
    add_column :cards, :type, :string
    Card.update_all(type: 'Servant')

    # Add Sort and Icon to Classes
    add_column :servant_classes, :sort_order, :integer
    add_column :servant_classes, :icon, :string

    create_table :card_images do |t|
      t.string :type
      t.string :name
      t.jsonb :image
      t.references :cards, foreign_key: true
    end
  end
end
