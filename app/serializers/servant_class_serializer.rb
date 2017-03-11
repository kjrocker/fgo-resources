class ServantClassSerializer < ActiveModel::Serializer
  include ActionView::Helpers::AssetTagHelper

  attributes :id, :name, :sort_order, :icon_url

  def icon_url
    asset_path("servant_icons/#{object.icon}")
  end
end
