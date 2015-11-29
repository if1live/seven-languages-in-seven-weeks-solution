#!/usr/bin/env ruby

=begin
CsvRow 객체를 리턴하는 each 메서드를 지원하도록 CSV 애플리케이션을 수정하라.
그 CsvRow에서 주어진 헤딩 값에 해당하는 칼럼의 값을 리턴하도록
method_missing을 사용하라.

예를 들어 이런 내용을 담은 파일이 있다고 하자.

one, two
lions, tigers

그러면 API는 다음과 같이 동작해야 한다.

csv = RubyCsv.new
csv.each {|row| puts row.one}

이러한 코드는 "lions"를 화면에 출력해야 한다
=end

FILENAME = 'test.csv'


class CsvRow
  def initialize(headers, contents)
    @headers = headers
    @contents = contents
  end

  def method_missing(name, *args)
    idx = @headers.index name.to_s
    return if idx.nil?
    @contents[idx]
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []

      file = File.new FILENAME
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << CsvRow.new(@headers, row.chomp.split(', '))
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

    def each(&block)
      @csv_contents.each do |row|
        block.call row
      end
    end
  end
end


class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

#csv = RubyCsv.new
#puts csv.headers.inspect
#puts csv.csv_contents.inspect

csv = RubyCsv.new
csv.each {|row| puts row.one}
