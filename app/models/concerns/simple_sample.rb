module SimpleSample
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def sample(amount = 1)
      raise ArgumentError, "Amount must be an integer!" unless amount.is_a? Integer
      raise ArgumentError, "Must sample at least one record!" if amount < 1
      order(sample_method).first if amount == 1
      order(sample_method).limit(amount)
    end

    private

    def sample_method
      @sample_method ||= random_string
    end

    def random_string
      adapter_type = connection.adapter_name.downcase.to_sym
      case adapter_type
      when :mysql
        "RAND()"
      when :sqlite, :postgresql
        "RANDOM()"
      else
        raise NotImplementedError, "Unknown adapter type '#{adapter_type}'"
      end
    end
  end
end
