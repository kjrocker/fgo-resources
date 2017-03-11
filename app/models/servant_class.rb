class ServantClass < ApplicationRecord
  has_many :servants

  ALL_CLASS_NAMES = {
    shielder: 'Shielder', saber: 'Saber', archer: 'Archer',
    lancer: 'Lancer', rider: 'Rider', caster: 'Caster',
    assassin: 'Assassin', berserker: 'Berserker', ruler: 'Ruler',
    avenger: 'Avenger', beast: 'Beast', other: 'Other',
  }.freeze

  ALL_CLASS_IDS = {
    shielder: 1, saber: 2, archer: 3,
    lancer: 4, rider: 5, caster: 6,
    assassin: 7, berserker: 8, ruler: 9,
    avenger: 10, beast: 11, other: 12,
  }.freeze

  def self.all_classes
    ALL_CLASS_IDS.keys
  end

  class << self
    ALL_CLASS_IDS.each do |k, v|
      # ServantClass.berserker = ServantClass.where(id: 8)
      define_method(k) { where(id: v) }
    end
  end
end
