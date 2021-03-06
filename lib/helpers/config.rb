module Conf
  require 'yaml'
  @config = YAML.load_file("#{ENV['HOME']}/.sd/config.rb")

  def self.sitelist
    list = []
    @config["config"]["sites"].each do |key, value|
      list << key
    end
    return list
  end

  def self.site(site)
    return @config["config"]["sites"][site]
  end

end