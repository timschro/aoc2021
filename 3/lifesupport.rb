input = File.readlines("input.txt")
gamma = []
epsilon = []

def count(arr, pos, val)
    count = 0
    arr.each do |row|
        count += 1 if row[pos].eql?(val)
    end
    count
end

oxygen=input.dup
for i in 0..(input[0].chomp.length - 1) do
    count0 = count(oxygen, i, "0")
    count1 = count(oxygen, i, "1")
    oxygen.select! {|v| v[i].eql?(count1 >= count0 ? "1" : "0")} 
    break if oxygen.length < 2
end

co2=input.dup
for i in 0..(input[0].chomp.length - 1) do
    count0 = count(co2, i, "0")
    count1 = count(co2, i, "1")
    co2.select! {|v| v[i].eql?(count1 >= count0 ? "0" : "1")} 
    break if co2.length < 2
end




p oxygen[0].chomp.to_i(2) * co2[0].chomp.to_i(2)
