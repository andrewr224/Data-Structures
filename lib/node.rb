class Node
  attr_reader :key, :left_child, :right_child
  attr_accessor :parent

  def initialize(key)
    @key = key
    @parent = nil
    @left_child = nil
    @right_child = nil
  end

  def left_child=(child)
    @left_child = child
    @left_child.parent = self
  end

  def right_child=(child)
    @right_child = child
    @right_child.parent = self
  end
end

class BinaryTree
  attr_reader :root

  def initialize(array)
    array = array.dup
    array.sort!
    mid = array.length/2

    @root = Node.new(array[mid])

    left = array[0...mid]
    right = array[mid+1..array.length-1]
    add_to_tree(left)
    add_to_tree(right)
  end

  def breadth_first_search(key)
    queue = [@root]
    found = false
    answer = nil

    until found || queue.length == 0
      item = queue.shift
      if item.key == key
        answer = item
        found = true
      end
      queue << item.left_child if item.left_child
      queue << item.right_child if item.right_child
    end
    answer
  end

  def depth_first_search(key)
    queue = [@root]
    found = false
    answer = nil

    until found || queue.length == 0
      item = queue.shift
      if item.key == key
        answer = item
        found = true
      end
      queue.unshift item.right_child if item.right_child
      queue.unshift item.left_child if item.left_child
    end
    answer
  end

  # Had to split a method in two, as recursive method doesn't
  # stop when found a target
  def dfs_rec(key)
    @target = nil
    dfs_rec_helper(key)
    @target
  end

  private
  def dfs_rec_helper(key, node=@root)
    return nil if node.nil?
    dfs_rec_helper(key, node.left_child)
    if node.key == key
      @target = node
      return nil
    end
    dfs_rec_helper(key, node.right_child)
  end

  def add_to_tree(array, root=@root)
    mid = array.length/2
    key = array[mid]

    if key < root.key
      root.left_child = Node.new(key)
      left = array[0...mid]
      right = array[mid+1..array.length-1]
      add_to_tree(left, root.left_child) if left.length > 0
      add_to_tree(right, root.left_child) if right.length > 0
    else
      if key == root.key && root.left_child.nil?
        root.left_child = Node.new(key)
      else
        root.right_child = Node.new(key)
      end
      left = array[0...mid]
      right = array[mid+1..array.length-1]
      add_to_tree(left, root.right_child) if left.length > 0
      add_to_tree(right, root.right_child) if right.length > 0
    end
  end
end
