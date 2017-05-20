class Card < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  mount_uploader :portrait, PortraitUploader

  def self.sorted
    order(official_id: :asc)
  end
end
