#!/usr/bin/env ruby
require 'optparse'
@options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: sdeploy.rb [options]"
  opts.on("-h", "--help", "Show this info") do
    puts opts
    exit
  end
end.parse!
