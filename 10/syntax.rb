
brackets={"(": ")","[": "]","{": "}", "<": ">"}
points_errors = {")": 3, "]": 57, "}": 1197, ">": 25137}
points_autocomplete = {")": 1, "]": 2, "}": 3, ">": 4}


sum_error= 0
sums_autocomplete = []
File.readlines("input.txt").each do |row|
    history=[]
    error = false
    row.strip.chars.each do |c|
        if brackets.key?(c.to_sym)
            history << c
        elsif history.last == brackets.key(c).to_s
            history.pop
        else    
            sum_error += points_errors[c.to_sym]
            error=true
            break
        end
    end

    unless error
        sum_autocomplete_row = 0
        history.reverse.each do |c|
            sum_autocomplete_row *= 5
            sum_autocomplete_row += points_autocomplete[brackets[c.to_sym].to_sym]
        end
        sums_autocomplete << sum_autocomplete_row
    end

end

p sum_error
p sums_autocomplete.sort[sums_autocomplete.length / 2]

