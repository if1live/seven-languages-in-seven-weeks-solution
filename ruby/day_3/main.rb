#!/usr/bin/env ruby

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
