class AddImagesToServants < ActiveRecord::Migration[5.0]
  def change
    # Prepare Servants Table for STI
    rename_table :servants, :cards
    add_column :cards, :type, :string

    # Set type to 'Servant' whenever there's a Servant Class
    Card.where('servant_class_id IS NOT NULL').update_all(type: 'Servant')

    # Add Avatars and Portraits
    add_column :cards, :avatar, :string
    add_column :cards, :portraits, :json

    # Add Icons to Classes
    add_column :servant_classes, :icon, :string
    add_column :servant_classes, :sort_order, :integer
  end
end
