require 'set'
class GraphNode
    attr_reader :val
    attr_accessor :neighbors

    def initialize(val)
        @val = val
        @neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

end


def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new

    until queue.empty?
        shifted_node = queue.shift
        if !(visited.include?(shifted_node))
            puts shifted_node.val
            return shifted_node if shifted_node.val == target_value
            queue.concat(shifted_node.neighbors)
            visited.add(shifted_node)
        end
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(f, "d")