require 'byebug'

class PolyTreeNode

    attr_reader :parent, :children, :value


    def initialize(value)
        #debugger
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if self.parent != nil
            self.parent.children.each.with_index do |node, idx|
                if node == self
                    self.parent.children.delete_at(idx)
                end
            end
        end

        @parent = parent_node # i.e. => self
        
        if (parent_node != nil) && !parent_node.children.include?(self)
            parent_node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(node)
        raise 'Not a child' if !self.children.include?(node)
        node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
            
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue.unshift(self)
        # debugger
        while !queue.empty?
            current_node = queue.pop
            return current_node if current_node.value == target_value
            current_node.children.each do |child|
                queue.unshift(child)
            end
        end
        nil
    end
end