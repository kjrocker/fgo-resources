module Taggable
  extend ActiveSupport::Concern
  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  module ClassMethods
    def with_tags
      includes(:tags)
    end
  end
end
