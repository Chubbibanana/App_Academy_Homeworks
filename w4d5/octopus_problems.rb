require 'byebug'
def sluggish_octopus(array)
    arr = array.dup
    (0...arr.length - 1).each do |i|
        (i + 1...arr.length).each do |j|
            arr[i], arr[j] = arr[j], arr[i] if arr[i].length > arr[j].length
        end
    end
    arr[-1]
end

def dominant_octopus(array)
    return merge_sort(array)[-1]
end

def merge(left, right, &prc)
    prc ||= Proc.new {|str1, str2| str1.length <=> str2.length} 
    merged = []
    until left.empty? || right.empty?
    if prc.call(left.first, right.first) == -1
        merged << left.shift
    else
        merged << right.shift
    end
end
merged + left + right
end

def merge_sort(array)
    return array if array.length <= 1
    left = array[0...array.length / 2]
    right = array[array.length/2 .. - 1]
    merge(merge_sort(left), merge_sort(right))
end

def clever_octopus(array)
    array.inject {|acc, ele| acc.length < ele.length ? ele : acc}
end



def slow_dance(dir, tiles_array)
    tiles_array.each_with_index {|ele, i| return i if dir == ele}
    nil
end

def fast_dance(dir, tiles_hash)
    tiles_hash[dir]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
hash = Hash.new{}
tiles_array.each_with_index {|ele, i| hash[ele] = i}
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)
p fast_dance("up", hash)
p fast_dance("right-down", hash)