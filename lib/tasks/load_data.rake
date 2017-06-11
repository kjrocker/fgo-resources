require 'csv'
namespace :load_data do
  COLUMN_MAP = {
    cost: 'Cost',
    base_hp: 'BaseHP',
    base_atk: 'BaseATK',
    max_hp: 'MaxHP',
    max_atk: 'MaxATK',
    quick_cards: 'Quick',
    buster_cards: 'Buster',
    arts_cards: 'Arts',
    unlockable: 'Unlock',
    limited: 'Limited',
    unplayable: 'Unplayable',
  }

  task servants: :environment do
    all_classes = ServantClass.all
    csv_text = File.read("#{Rails.root}/db/raw_data/servants.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.map(&:to_hash).each do |row|
      update_hash = {}
      COLUMN_MAP.each do |key, val|
        update_hash[key] = row[val] || 0
      end
      Servant.find_or_create_by(
        official_id: row['ID'].to_i,
        name: row['Name'],
        rarity: row['Rarity'],
        servant_class_id: all_classes.find_by(name: row['Class']).id
      ).update(update_hash)
    end
  end

  task servant_classes: :environment do
    csv_text = File.read("#{Rails.root}/db/raw_data/servant_classes.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.map(&:to_hash).each do |row|
      ServantClass.find_or_create_by(name: row['Name']).update(
        sort_order: row['Sort'],
        icon: row['Image'],
      )
    end
  end
end
