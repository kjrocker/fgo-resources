class Card < ApplicationRecord
  include Taggable
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :portrait, PortraitUploader

  def self.sorted
    order(official_id: :asc)
  end
end
