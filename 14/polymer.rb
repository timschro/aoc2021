input=File.read("input.txt")
template, pairs_input = input.split("\n\n")
pairs = {}
pairs_input.split("\n").each do |el| 
    el = el.split(" -> ")
    pairs[el.first] = el.last
end

10.times do |step|
    new_template = ""
    template.chars.each_cons(2) do |a,b|
        pair = a + b
        new_template += a + pairs[pair]
    end
    template = new_template +  template.chars.last
end
res = template.chars.tally.values
p res.max - res.min