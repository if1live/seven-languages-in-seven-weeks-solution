#!/usr/bin/env ruby

# ex 5
# 파일에서 읽은 루비 프로그램을 실행하라
code = File.read "code.rb"
eval code
