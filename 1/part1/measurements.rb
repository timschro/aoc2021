count=0
prev=nil
File.readlines("input.txt").each do |value|
    count += 1 if !prev.nil? && value.to_i > prev
    prev = value.to_i
end
p count