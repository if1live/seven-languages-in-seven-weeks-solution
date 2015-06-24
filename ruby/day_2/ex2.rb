#!/usr/bin/env ruby

# ex 2
# Tree 클래스는 흥미로웠지만
# 깔끔한 사용자 인터페이스를 갖는 새 트리를 만들도록 허용하지는 않았다.
# initializer가 해시 내부에 포함된 구조를 받아들이도록 해보자.
# 다음과 같은 방식으로 트리를 정의할 수 있어야 한다
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
