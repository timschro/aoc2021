fishes = File.readlines("input.txt")[0].split(",").map(&:to_i).group_by { |e| e }.map { |k, v| [k, v.count] }.to_h


DAYS = 256

1.upto(DAYS) do |day|
  new_fish = Hash.new(0)

  fishes.each do |age, count|
    if age == 0
      new_fish[6] += count
      new_fish[8] += count
    else
      new_fish[age - 1] += count
    end
  end
  fishes = new_fish
end
p fishes.values.sum
