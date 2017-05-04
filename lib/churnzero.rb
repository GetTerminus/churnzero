require "churnzero/version"
require "churnzero/client"
require "churnzero/configuration"


module Churnzero
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
