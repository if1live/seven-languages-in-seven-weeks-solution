#!/usr/bin/env ruby

# ex 1
# "Hello, world"라는 문자열을 출력하라.
puts "Hello, world"

# ex 2
# "Hello, Ruby"라는 문자열에서 "Ruby"라는 단어의 인덱스를 찾아보라.
word_idx = "Hello, Ruby".index "Ruby"
puts word_idx

# ex 3
# 당신 자신의 이름을 열 번 출력하라.
name = "MY_NAME"
i = 0
while i < 10
  puts name
  i += 1
end

# ex 4
# 1부터 10까지의 숫자를 대상으로
# "This is sentence number 1"이라는 문자열을 출력하라.
i = 1
while i <= 10
  puts "This is sentence number #{i}"
  i += 1
end

# ex 5
# 파일에서 읽은 루비 프로그램을 실행하라
code = File.read "code.rb"
eval code

# ex 6
# 보너스 문제 : 더 많은 연습이 필요하다고 느낀다면,
# 임의의 수를 고르는 프로그램을 작성해보라.
# 사용자가 어떤 수를 추측하도록 하고,
# 추측한 값이 너무 큰지 아니면 작은지를 화면에 나타내라.
# (힌트 : rand(10)은 0에서 9 사이 수 중에서 임의의 수를 하나 선택할 것이다.
# gets는 키보드로부터 정수로 바꿀 수 있는 문자열을 읽어온다.
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
