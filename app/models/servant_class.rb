class ServantClass < ApplicationRecord
  has_many :servants

  ALL_CLASSES = {
    shielder: 'Shielder', saber: 'Saber', archer: 'Archer',
    lancer: 'Lancer', rider: 'Rider', caster: 'Caster',
    assassin: 'Assassin', berserker: 'Berserker', ruler: 'Ruler',
    avenger: 'Avenger', beast: 'Beast', other: 'Other',
  }.freeze

  def serialize
    @serialize ||= ServantClassSerializer.new(self)
  end

  def self.with_servants
    joins(:servants).distinct
  end

  def self.sorted
    order(:sort_order)
  end

  def self.all_classes
    ALL_CLASSES.keys
  end

  class << self
    ALL_CLASSES.each do |k, v|
      # ServantClass.berserker = ServantClass.where(id: 8)
      define_method(k) { where(name: v) }
    end
  end
end
