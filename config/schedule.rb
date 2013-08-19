#!/usr/local/bin/ruby
require 'yaml'
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#set :path, File.expand_path(File.dirname(__FILE__)
set :environment, :development
set :output, {:error => '/Users/morojalsulaimani/ProjectAllocation/log/error.log', 
    :standard => '/Users/morojalsulaimani/ProjectAllocation/log/cron.log'}
MAILTO='malsulaimani@yahoo.com' 

#set :output, '/var/log/myApp-thinking_sphinx_cron_log'
#require File.expand_path(File.dirname(__FILE__) + "/environment")
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.minutes do
  runner "Alloc.next_for_allocation"
end
# Learn more: http://github.com/javan/whenever
