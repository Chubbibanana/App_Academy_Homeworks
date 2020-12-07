require 'byebug'
class GraphNode
    attr_reader :value
    attr_accessor :neighbors
    def initialize(value)
        @value = value
        @neighbors = []

    end

    def neighbors=(node_array)
        node_array.each do |node|
            @neighbors << node
        end
    end
    
    def self.bfs(starting_node, target_value)
        queue = [starting_node]
        parsed = []
        until queue.empty?
            #queue.shift => [0, 1, 2] = 0
            next_node = queue.shift
            return next_node if next_node.value == target_value
            parsed << next_node
            add_to = next_node.neighbors.select{|ele| !parsed.include?(ele)}
            queue.concat(add_to)
            queue += add_to
        end
        nil
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
p GraphNode.bfs(a, 'b')