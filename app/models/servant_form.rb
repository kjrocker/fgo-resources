class ServantForm
  include ActiveModel::Model

  delegate :id, to: :servant

  attr_accessor :name, :official_id, :rarity, :tag_list, :servant_class, :avatar, :all_classes, :servant

  validates :name, presence: true
  validates :official_id, presence: true
  validates :rarity, presence: true
  validates :servant_class, presence: true

  def initialize(attr = {})
    if attr[:id].present?
      @servant = Servant.find(attr[:id])
      @name = attr[:name] || servant.name
      @official_id = attr[:official_id] || servant.official_id
      @avatar = attr[:avatar] || servant.avatar
      @portraits = attr[:portraits] || servant.portraits
      @rarity = attr[:rarity] || servant.rarity
      @servant_class = attr[:servant_class] || servant.servant_class_id
      @tags = attr[:tag_list] || servant.tag_list
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
      name: name,
      official_id: official_id,
      rarity: rarity,
      servant_class_id: servant_class,
      avatar: avatar
    )
  end
end
