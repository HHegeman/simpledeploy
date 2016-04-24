#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path("../lib", File.dirname(__FILE__)))
require "simpledeploy"
require 'optparse'
@options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: sdeploy.rb [options]"
  opts.on("-h", "--help", "Show this info") do
    puts opts
    exit
  end
  opts.on("-l", "--list", "gives a list of all configured sites.") do |ext|
    @options[:list] = ext
  end
end.parse!
if @options[:list]
  puts "The following websites are configured:"
  puts Conf.sitelist
end