fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

def oh_n_squared(fishes)
    fishes.each_with_index do |fish1, i1|
        max_length = true
        
        fishes.each_with_index do |fish2, i2|
          next if i1 == i2
          max_length = false if fish2.length > fish1.length
        end
        
        return fish1 if max_length
    end

end

# p oh_n_squared(fishes)


class Array
    #this should look familiar
    def merge_sort(&prc)
      prc ||= Proc.new { |x, y| x <=> y }
  
      return self if count <= 1
  
      midpoint = count / 2
      sorted_left = self.take(midpoint).merge_sort(&prc)
      sorted_right = self.drop(midpoint).merge_sort(&prc)
  
      Array.merge(sorted_left, sorted_right, &prc)
    end
  
    private
    def self.merge(left, right, &prc)
      merged = []
  
      until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
          merged << left.shift
        when 0
          merged << left.shift
        when 1
          merged << right.shift
        end
      end
  
      merged.concat(left)
      merged.concat(right)
  
      merged
    end
end

def nlogn_biggest_fish(fishes)
    # sort the array longest to shortest
    prc = Proc.new { |x, y| y.length <=> x.length }
    #return the first element
    fishes.merge_sort(&prc)[0]
end

# p nlogn_biggest_fish(fishes)

def linear_biggest_fish(fishes)
    biggest_fish = fishes.first

    fishes.each do |fish|
        if biggest_fish.length < fish.length
            biggest_fish = fish
        end
    end

    biggest_fish
end

# p linear_biggest_fish(fishes)


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
direction = "up"

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, index|
        if tile == direction
            return index 
        end
    end
end

p slow_dance("up", tiles_array)

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end

p fast_dance("left-up", tiles_hash)