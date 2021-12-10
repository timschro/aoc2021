

input = File.readlines("input.txt")
map=Array.new(input.length) {Array.new(input[0].strip.length)}
input.each_with_index do |row, rindex|
    row.scan(/\d{1}/).map {|e| e.to_i}.each_with_index do |col, cindex|
        map[rindex][cindex] = col
    end
end


low = []
basins = []

map.each_with_index do |row, rindex|
    row.each.each_with_index do |col, cindex|
       check=[]
       check << map[rindex-1][cindex] unless (rindex-1) < 0
       check << map[rindex][cindex-1] unless (cindex-1) < 0
       check << map[rindex+1][cindex] unless rindex > input.length - 2
       check << map[rindex][cindex+1] unless cindex > row.length - 1
       check.reject! {|e| e.nil? || e>col}
       low << col if check.empty?

    end
end

p low.map{|e| e+=1}.sum