input = File.readlines("input.txt")[0].split(",").map { |el| el.to_i }
sorted = input.sort
mid = (sorted.length - 1) / 2.0
pos = ((sorted[mid.floor] + sorted[mid.ceil]) / 2.0).round
p input.inject(0) { |sum, x| sum + (pos - x).abs }

avg = input.sum / input.size.to_f
res = []
[avg.ceil, avg.floor].each do |target|
  res << input.inject(0) { |sum, x| sum + 1.upto((target - x).abs).sum }
end
p res.min
