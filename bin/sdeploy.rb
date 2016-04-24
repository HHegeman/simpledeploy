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
  opts.on("-i", "--install", "Clone repo to disk and add apache config.") do |ext|
    @options[:install] = ext
  end
  opts.on("-u", "--update", "git pull all repos and reload apache.") do |ext|
    @options[:update] = ext
  end
  opts.on("-s ", "--sites", "Specify which sites should be done. (for more sites use , seperated list.) ") do |ext|
    @options[:sites] = ext
  end
  opts.on("-l", "--list", "gives a list of all configured sites.") do |ext|
    @options[:list] = ext
  end
  opts.on("-a", "--apache", "Regenerate apache config for given sites.") do |ext|
    @options[:apache] = ext
  end
  opts.on("--delete", "delete a website (removes site from apache config and removes repo from disk)") do |ext|
    @options[:delete] = ext
  end
  opts.on("-v", "--verbose", "output logging.") do |ext|
    @options[:verbose] = ext
  end
end.parse!

Log.verbose(@options[:verbose])

if @options[:list]
  puts "The following websites are configured:"
  puts Conf.sitelist
  exit 0
end

# check if given options with -s are actually posible else raise error.
Sort.input(Conf.sitelist, @options[:sites])

puts Log.getlog