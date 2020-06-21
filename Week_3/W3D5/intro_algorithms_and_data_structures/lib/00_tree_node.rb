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

        @parent = parent_node
        
        if (parent_node != nil) && !parent_node.children.include?(self)
            parent_node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end


end