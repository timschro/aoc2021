
# https://adventofcode.com/2021/day/1#part2
# three-measurement sliding window.
values = []
input=File.readlines("input.txt")
0.upto(input.length - 3)  {|i| values << input[i].to_i + input[i+1].to_i + input[i+2].to_i }

count=0
prev=nil
values.each do |value|
    count += 1 if !prev.nil? && value > prev
    prev = value
end
p count
