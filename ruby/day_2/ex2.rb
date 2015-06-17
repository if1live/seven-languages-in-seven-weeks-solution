#!/usr/bin/env ruby

# ex 2
data = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

class Tree
  attr_accessor :children, :node_name

  def initialize(data)
    @node_name = data.keys[0]

    @children ||= []
    children_data = data[@node_name]
    children_data.each do |key, value|
      @children << Tree.new({ key => value })
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

root = Tree.new data
root.visit_all {|node| puts node.node_name }
