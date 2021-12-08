count = 0
File.readlines("input.txt").each { |row| count += row.split('|')[1].strip.split.map{|e| e.length}.reject{|e| ![2,4,3,7].include?(e)}.length }
p count
