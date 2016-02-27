require 'logger'

module Ultron
  module Logger
    extend self

    def logger
      logger ||= ::Logger.new(STDOUT)
    end

    def debug(message)
      logger.debug(message)
    end

    def info(message)
      logger.info(message)
    end

    def warn(message)
      logger.warn(message)
    end

    def error(message)
      logger.error(message)
    end
  end
end
