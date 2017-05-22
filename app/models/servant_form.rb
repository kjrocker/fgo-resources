class ServantForm
  include ActiveModel::Model

  delegate :id, :rarity, :official_id, :name, to: :servant

  attr_accessor :tag_list, :servant_class, :avatar, :portraits, :servant

  def initialize(attr = {})
    if attr[:id].present?
      @servant = Servant.find(attr[:id])
      @avatar = attr[:avatar] || servant.avatar
      @portraits = attr[:portraits] || servant.portraits
      @tag_list = attr[:tag_list] || servant.tag_list
    else
      super(attr)
    end
  end

  def update
    if valid?
      update_form
      true
    else
      false
    end
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'ServantForm')
  end

  def persisted?
    true
  end

  def all_classes
    @all_classes ||= ServantClass.pluck(:name, :id)
  end

  private

  def update_form
    @servant.update(
      avatar: avatar,
      portraits: portraits
    )
    @servant.tag_list = tag_list
  end
end
