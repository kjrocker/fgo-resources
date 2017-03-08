class Servant < ApplicationRecord
  belongs_to :servant_class

  class << self
    ServantClass::ALL_CLASSES.each do |k, v|
      # Servant.saber = Servant.joins(:servant_class).merge(ServantClass.saber)
      define_method(k) { joins(:servant_class).merge(ServantClass.send(k)) }
    end
  end
end
