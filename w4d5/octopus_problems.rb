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

array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p dominant_octopus(array)