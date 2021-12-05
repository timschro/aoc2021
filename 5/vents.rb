input = File.readlines("input.txt")
vents = []
vents_diagonal = []
input.each do |row|
  from_s, to_s = row.chomp.split(" -> ")
  from = from_s.split(",").map { |el| el.to_i }
  to = to_s.split(",").map { |el| el.to_i }
  if from[0] == to[0]
    [from[1], to[1]].min.upto([from[1], to[1]].max) do |i|
      vents << [from[0], i]
    end
  elsif from[1] == to[1]
    [from[0], to[0]].min.upto([from[0], to[0]].max) do |i|
      vents << [i, from[1]]
    end
  else
    count = 0
    if from[0] < to[0]
      from[0].upto(to[0]) do |i|
        if from[1] < to[1]
          y = from[1] + count
        else
          y = from[1] - count
        end
        vents_diagonal << [i, y]
        count += 1
      end
    else
      to[0].upto(from[0]) do |i|
        if from[1] < to[1]
          y = to[1] - count
        else
          y = to[1] + count
        end
        vents_diagonal << [i, y]
        count += 1
      end
    end
  end
end

p vents.tally.reject { |k, v| v < 2 }.length
p (vents + vents_diagonal).tally.reject { |k, v| v < 2 }.length
