#part 1
🧐=0
File.readlines("input.txt").each { |r| 🧐 += r.split('|')[1].strip.split.map{|e| e.length}.select{|e| [2,4,3,7].include?(e)}.length }
p 🧐


#part 2
sum = 0
File.readlines("input.txt").each do |row|
    pattern, output = row.split('|')
    patterns = pattern.strip.split

    p = []

    p[1] = patterns.select{|e| e.length==2}.first
    p[4] = patterns.select{|e| e.length==4}.first
    p[7] = patterns.select{|e| e.length==3}.first
    p[8] = patterns.select{|e| e.length==7}.first

    patterns.select{|e| e.length==6}.each do |n|
        c=0
        p[4].chars.each do |x| 
            c+=1 if n.include?(x)
        end
        if (n.include?(p[1][0]) && !n.include?(p[1][1])) || (!n.include?(p[1][0]) && n.include?(p[1][1]))
            p[6] = n 
        elsif c==3
            p[0] = n
        else
            p[9] = n
        end        
    end

    patterns.select{|e| e.length==5}.each do |n|
        c=0
        p[9].chars.each do |x| 
            c+=1 if n.include?(x)
        end
        if n.include?(p[1][0]) && n.include?(p[1][1])
            p[3] = n 
        elsif c==5
            p[5] = n
        else
            p[2] = n
        end
    
    end
    p.map! {|e| e.chars.sort}
    segments = output.strip.split
    digits = ""
    segments.each do |segment|
        digits += p.index(segment.chars.sort).to_s
    end
    sum += digits.to_i
end

p sum

# 1 used 2 segments
# 4 uses 4 segments
# 7 uses 3 segments
# 8 uses 7 segments
# 0, 6, 9 use 6 segments:
# 6 shares exactly 1 segment with 1
# 0 shares exactly 3 segments with 4
# else  9
# 2, 3, 5 use 5 segments:
# 3 shares exactly 2 segments with 1
# 5 shares exactly 5 segments with 9
# else 2