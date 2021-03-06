#! /usr/bin/env ruby
# coding: utf-8

require 'csv'
require './lib/jira/jira_api_caller'

# ------------------------------------------------------------

def usage
  puts <<STR
  > set_storypoints.rb <csv_file>
  or
  > set_storypoints.rb <key> <storypoint>

STR
end

def set_storypoints_from_(csv_file)
  CSV.open(csv_file, headers: true).each_with_index do |row, index|
    print "#{index+1}: "

    key = row["key"]
    storypoint = row["storypoint"]

    if key.nil? || storypoint.nil?
      puts "invalid [#{key} : #{storypoint}]"
      next
    end

    set_storypoint(key, storypoint)
  end
end

def set_storypoint(key, story_point)
  param_hash = Jira::Issue.compose_hash(:story_point => story_point)
  JiraApiCaller.update_issue(key, param_hash)
  puts "done [#{key} : #{story_point}]"
end


# -- main --------------------------------------------------

if ARGV.length == 1
  csv_file = ARGV[0]
  abort "Error: must be csv file #{csv_file}" unless (File.exist?(csv_file) && File.extname(csv_file) == ".csv")

  set_storypoints_from_(csv_file)

elsif ARGV.length == 2
  key = ARGV[0]
  storypoint = ARGV[1]

  set_storypoint(key, storypoint)

else
  usage
  abort
end
