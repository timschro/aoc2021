$octos = File.readlines("input.txt").map{|el| el.strip.scan(/\d{1}/).map{|e| e.to_i}}

$count = 0


def flash(row, col)
    return if row < 0 || col < 0 || $octos[row].nil? || $octos[row][col].nil? ||  $flashed.include?([row, col])
    $octos[row][col] += 1
    return if $flashed.include?([row, col])
   if $octos[row][col] > 9
    $count += 1
    $flashed << [row, col]
    $octos[row][col] = 0
    flash(row - 1, col - 1)
    flash(row - 1, col)
    flash(row - 1, col + 1)
    flash(row, col - 1)
    flash(row, col + 1)
    flash(row + 1, col - 1)
    flash(row + 1, col)
    flash(row + 1, col + 1)
   end   
end

#p $octos

1.upto(500) do |i|
    $flashed = []
    $octos.map!{ |sub| sub.map!{ |e| e+=1 } }
    $octos.each_with_index do |row, rindex| 
        row.each_with_index do |col, cindex|
            flash(rindex, cindex) if col > 9
        end
    end 
    p $count if i==100
    if $flashed.length == ($octos.length * $octos.first.length)
        p i
        break
     end
end
