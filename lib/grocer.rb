require 'grocer/version'
require 'grocer/engine'

module Grocer
  def self.configuration
    @configuration ||= Config.new
  end

  def self.configure
    yield(configuration)
  end
end
