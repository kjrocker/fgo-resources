require 'csv'
namespace :load_data do
  task servants: :environment do
    all_classes = ServantClass::ALL_CLASS_IDS
    csv_text = File.read("#{Rails.root}/db/raw_data/servants.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.map(&:to_hash).each do |row|
      Servant.find_or_create_by(official_id: row['ID'].to_i).update(
        name: row['Name'],
        rarity: row['Rarity'].to_i,
        servant_class_id: all_classes[row['Class'].downcase.to_sym]
      )
    end
  end

  task servant_classes: :environment do
    ids, names = ServantClass::ALL_CLASS_IDS, ServantClass::ALL_CLASS_NAMES
    ActiveRecord::Base.connection.execute(
      "TRUNCATE TABLE servants, servant_classes RESTART IDENTITY;"
    )
    ServantClass.all_classes.each do |k|
      ActiveRecord::Base.connection.execute(
        "INSERT INTO servant_classes (id, name) VALUES (#{ids[k]},'#{names[k]}');"
      )
    end
    ActiveRecord::Base.connection.execute(
      "ALTER SEQUENCE servant_classes_id_seq RESTART WITH #{ids.keys.length + 1};"
    )
  end
end
