class Servant < ApplicationRecord
  include Taggable
  belongs_to :servant_class

  mount_uploader :avatar, AvatarUploader
  mount_uploader :portrait, PortraitUploader

  def self.sorted
    order(official_id: :asc, rarity: :asc)
  end

  class << self
    ServantClass.all_classes.each do |k|
      # Servant.saber = Servant.joins(:servant_class).merge(ServantClass.saber)
      define_method(k) { joins(:servant_class).merge(ServantClass.send(k)) }
    end
  end
end
