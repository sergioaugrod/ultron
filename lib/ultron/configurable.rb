module Ultron
  module Configurable
    attr_accessor :serial, :mqtt

    def self.keys
      [:serial, :mqtt]
    end

    def configure
      yield(self)
    end
  end
end
