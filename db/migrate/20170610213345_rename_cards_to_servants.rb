class RenameCardsToServants < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :type, :string

    rename_table :cards, :servants

    add_column :servants, :cost, :integer, default: 0, null: false
    add_column :servants, :base_hp, :integer, default: 0, null: false
    add_column :servants, :base_atk, :integer, default: 0, null: false
    add_column :servants, :max_hp, :integer, default: 0, null: false
    add_column :servants, :max_atk, :integer, default: 0, null: false

    add_column :servants, :buster_cards, :integer, default: 0, null: false
    add_column :servants, :quick_cards, :integer, default: 0, null: false
    add_column :servants, :arts_cards, :integer, default: 0, null: false

    add_column :servants, :unlockable, :boolean, default: false, null: false
    add_column :servants, :limited, :boolean, default: false, null: false
    add_column :servants, :unplayable, :boolean, default: false, null: false

    add_column :servants, :comments, :text, array: true, default: [], null: false

    add_column :servants, :traits, :string, array: true, default: [], null: false
  end
end
