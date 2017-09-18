class BinaryTree


  class Node
    attr_reader :key, :parent

    def initialize(key)
      @key = key
      @parent = nil
      @left_child = nil
      @right_child = nil
    end

    def parent=(parent_node)
      @parent.add_child(parent_node) if @parent
      @parent = parent_node
      parent_node.add_child(self) unless parent_node.children.include?(self)
    end

    def remove_parent
      parent_node = @parent
      @parent = nil
      parent_node.remove_child(self)
    end

    def add_child(child)
      if @left_child.nil?
        @left_child = child
        child.parent = self unless child.parent == self
      elsif @right_child.nil?
        if @left_child.key < child.key
          @right_child = child
        else
          @left_child, @right_child = child, @left_child
        end
        child.parent = self unless child.parent == self
      end
    end

    def children
      children_list = []
      children_list << @left_child if @left_child
      children_list << @right_child if @right_child
      children_list
    end

    def remove_child(child)
      @left_child = nil if @left_child == child
      @right_child = nil if @rigth_child == child

      child.remove_parent unless child.parent.nil?
    end

  end
end

