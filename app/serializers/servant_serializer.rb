class ServantSerializer < ActiveModel::Serializer
  attributes :id, :official_id, :name, :rarity, :className, :firstIcon

  def className
    object.servant_class.name
  end

  def firstIcon
    object.icons.present? ? object.icons.first.image : nil
  end
end
