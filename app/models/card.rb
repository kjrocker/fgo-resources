class Card < ApplicationRecord
  has_many :portraits
  has_many :icons
end
