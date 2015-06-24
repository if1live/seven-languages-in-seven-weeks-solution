#!/usr/bin/env ruby

# ex 1
# 16개의 수를 담고 있는 배열의 내용을, each만 사용해서 한 번에 네 개씩 출력하라.
# 다음으로는 Enumerable 안에 있는 each_slice를 이용해서 동일한 작업을 수행하라.
data = (0...16).to_a
puts "input : #{data}"

puts "each_4"
class Array
  def each_4(&block)
    buffer = []
    self.each_with_index do |x, idx|
      buffer << x
      if idx % 4 == 3
        block.call buffer
        buffer = []
      end
    end
  end
end
data.each_4 { |x| p x }


puts "each_slice"
data.each_slice(4) { |x| p x }
