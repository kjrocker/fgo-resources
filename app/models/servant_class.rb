class ServantClass < ApplicationRecord
  has_many :servants

  ALL_CLASSES = {
      berserker: 'Berserker',
      ruler: 'Ruler', avenger: 'Avenger', shielder: 'Shielder',
      saber: 'Saber', lancer: 'Lancer', archer: 'Archer',
      rider: 'Rider', caster: 'Caster', assassin: 'Assassin',
  }.freeze

  class << self
    ALL_CLASSES.each do |k, v|
      # ServantClass.berserker = ServantClass.where(name: 'Berserker')
      define_method(k) { where(name: v) }
    end
  end
end
