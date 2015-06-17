#!/usr/bin/env ruby

# ex 1
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
