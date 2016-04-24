module Conf
  require 'yaml'
  @config = YAML.load_file("#{ENV['HOME']}/.sd/config.rb")
end