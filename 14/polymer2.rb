input=File.read("input.txt")
template_input, pairs_input = input.split("\n\n")
pairs = {}
pairs_input.split("\n").each do |el| 
    el = el.split(" -> ")
    pairs[el.first] = el.last
end

template = template_input.chars.each_cons(2).tally
40.times do |step|
    p step
    new_template = {}
    template.each do |(a,b),tally|
   #     p "#{a}, #{b}, #{tally}"
        pair = a + b
        el = (a + pairs[pair]).chars
        new_template[el].nil? ? new_template[el] = tally : new_template[el] += tally   
        el = (pairs[pair] + b).chars
        new_template[el].nil? ? new_template[el] = tally : new_template[el] += tally     
    end
    template = new_template
end
res = {}

template.each_with_index do |el, index|
    (a,b),i = el
    res[a].nil? ? res[a]=i : res[a] += i
end
res[template_input.chars.last] += 1
p res
p res.values.max - res.values.min
