class Stack
    def initialize
      @stack = []
    end

    def push(el)
      @stack << el
    end

    def pop
      @stack.pop
    end

    def peek
      @stack[-1]
    end
end

class Queue 
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[-1]
    end

end

class Map
    attr_reader :array
    def initialize
        @array = []
    end

    def set(key, value)
        pair_index = @array.index { |pair| pair[0] == key }
        if pair_index
            @array[pair_index][1] = value
        else
            @array << [key, value]
        end
    end

    def get(key)
        @array.each {|pair| return pair[1] if pair[0] == key}
    end

    def delete(key)
        @array.reject! {|pair| key == pair[0]}
    end

    def show
        

    end




end
