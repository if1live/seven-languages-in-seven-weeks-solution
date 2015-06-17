#!/usr/bin/env ruby
# ex 3

FILENAME = 'ex1.rb'
REGEXP = /def/

File.foreach(FILENAME).with_index do |line, line_num|
  line = line.strip
  puts "#{line_num} : #{line}" if REGEXP =~ line
end
