input = File.readlines("input_test.txt")
gamma = []
epsilon = []

for i in 0..(input[0].chomp.length - 1) do
    count1 = count0 = 0
    input.each do |row|
        count0 += 1 if row[i].eql?("0")
        count1 += 1 if row[i].eql?("1")
    end
    if count1 >= count0
        gamma[i] = "1"
        epsilon[i] = "0" 
    else    
        gamma[i] = "0"
        epsilon[i] = "1" 
    end
end
p gamma.join.to_i(2) * epsilon.join.to_i(2)
