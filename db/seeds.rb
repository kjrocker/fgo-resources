# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Servant.delete_all
# ServantClass.delete_all

class_ids = {}

ServantClass::ALL_CLASSES.each do |k, v|
  class_ids[k] = ServantClass.find_or_create_by(name: v).id
end

servants = [
  { name: 'Nero Claudius', servant_class_id: class_ids[:saber], rarity: 4 },
  { name: 'Jack the Ripper', servant_class_id: class_ids[:assassin], rarity: 5 },
  { name: 'Medea', servant_class_id: class_ids[:caster], rarity: 3 },
  { name: 'Medea (Lily)', servant_class_id: class_ids[:caster], rarity: 4 },
  { name: 'Attila', servant_class_id: class_ids[:saber], rarity: 5 },
  { name: 'Mordred', servant_class_id: class_ids[:saber], rarity: 5 },
  { name: 'Heracles', servant_class_id: class_ids[:berserker], rarity: 4},
  { name: 'Medb', servant_class_id: class_ids[:rider], rarity: 5},
]

servants.each do |servant|
  Servant.find_or_create_by(servant)
end
