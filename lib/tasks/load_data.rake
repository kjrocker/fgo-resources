require 'csv'
namespace :load_data do
  desc "TODO"
  task servants: :environment do
    all_classes = ServantClass.all
    csv_text = File.read("#{Rails.root}/db/raw_data/servants.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.map(&:to_hash).each do |row|
      Servant.find_or_create_by(
        name: row['Name'],
        rarity: row['Rarity'].to_i,
        servant_class_id: all_classes.find_by(name: row['Class']).id
      )
    end
  end

end
