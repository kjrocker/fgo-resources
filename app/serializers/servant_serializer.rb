class ServantSerializer < ActiveModel::Serializer
  attributes :id, :official_id, :name, :rarity, :className

  def className
    object.servant_class.name
  end
end
