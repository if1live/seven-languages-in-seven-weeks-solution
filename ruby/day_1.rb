#!/usr/bin/env ruby

# ex 1
puts "Hello, world"

# ex 2
word_idx = "Hello, Ruby".index "Ruby"
puts word_idx

# ex 3
name = "MY_NAME"
i = 0
while i < 10
  puts name
  i += 1
end

# ex 4
i = 1
while i <= 10
  puts "This is sentence number #{i}"
  i += 1
end

# ex 5
success = false
target = rand 10
puts "input 0~9"
while success == false
  input = gets.to_i
  if input < target
    puts "input < target"
  elsif input > target
    puts "input > target"
  else
    success = true
  end
end
