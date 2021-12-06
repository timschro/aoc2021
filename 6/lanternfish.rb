input = File.readlines("input_test.txt")[0].split(",").map { |el| el.to_i }


def lanternfishs_growth(days, fishes)
  1.upto(days) do |day|
    temp = []
    fishes.each do |f|
      if f == 0
        f = 6
        temp << 8
      else
        f -= 1
      end
      temp << f
    end
    fishes = temp
  end
  fishes.length
end

p lanternfishs_growth(80, input)

