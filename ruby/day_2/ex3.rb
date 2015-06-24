#!/usr/bin/env ruby

# ex 3
# 파일 안에서 어떤 특정한 표현을 포함하고 있는 줄을 골라서 출력하는
# 간단한 grep 도구를 작성하라.
# 간단한 정규표현식을 작성하고 파일에서 줄을 읽어 들이는 작업이 필요할 것이다
# (이러한 작업이 루비에서는 놀라울 정도로 간단하다).
# 원한다면 해당 줄의 줄번호를 함께 출력하라.
FILENAME = 'ex1.rb'
REGEXP = /def/

File.foreach(FILENAME).with_index do |line, line_num|
  line = line.strip
  puts "#{line_num} : #{line}" if REGEXP =~ line
end
