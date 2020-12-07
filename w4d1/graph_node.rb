class GraphNode
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

    def bfs(starting_node, target_value)
        queue = [starting_node]
        parsed = []
        until queue.empty?
            next_node = queue.shift
            return next_node if next_node.value == target_value
            add_to = next_node.children.select{|ele| !parsed.include?(ele)}
            queue << add_to
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
bfs(a, 'b')