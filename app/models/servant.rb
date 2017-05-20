class Servant < Card
  belongs_to :servant_class

  class << self
    ServantClass.all_classes.each do |k|
      # Servant.saber = Servant.joins(:servant_class).merge(ServantClass.saber)
      define_method(k) { joins(:servant_class).merge(ServantClass.send(k)) }
    end
  end
end
