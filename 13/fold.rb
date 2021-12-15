points, instructions = File.read('input.txt').split("\n\n")
points=points.lines.map {|el| el.split(',').map(&:to_i) }
instructions=instructions.lines.map {|el| el.match(/(x|y)=(\d+)$/).captures }.map {|el| [el[0],el[1].to_i]}

grid=Array.new(points.collect(&:last).max + 1) {Array.new(points.collect(&:first).max + 1){" "}}
points.each do |point|
    x = point.first
    y = point.last
    grid[y][x]="#"
end

instructions.each_with_index do |inst, index|
    fold = inst.last

    grid.each_with_index do |row, y|
        row.each_with_index do |col, x|
            next unless col === "#"
            if inst.first.eql?("y") && y > fold
                grid[y][x]=" "
                y = fold - (y - fold)
            elsif inst.first.eql?("x") && x > fold
                grid[y][x]=" "
                x = fold - (x - fold)
            end
            grid[y][x]="#"
        end

    end
    p grid.flatten.count("#") if index==0
end


grid.each_with_index do |row, y|
    row.each_with_index do |col, x|
       print col if x < instructions.select{|el| el.first=="x"}.collect(&:last).min
    end
   puts
   break if y >= instructions.select{|el| el.first=="y"}.collect(&:last).min
end
