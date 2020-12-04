class Stack

    def initialize(array = [])
        @stack = array
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
end

class Queue

    def initialize(array = [])
        @queue = array
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

class Map

    def initialize(array = [])
        @map = array
    end

    def set(key, value)
        @map.each_with_index do |pair, i|
            if pair[0] == key
                @map[i] = [key, value]
                return @arr
            end
        end
        @map.push([key, value])
    end

    def get(key)
        @map.any? {|pair| pair[0] == key } ? (@map.select {|pair| pair[0] == key}) : nil 
    end

    def delete(key)
        @map.reject! {|pair| pair[0] == key}
    end

    def show
        @map
    end

end

map = Map.new([[0, 1 ], [1, 2], [2, 3]])
map.set(4, 5)
p map.get(4) # => 0, 1, 1, 2, 2, 3, 4, 5
map.delete(0)
p map.show # => 0, 1 removed
