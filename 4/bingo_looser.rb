
def check_board(board, number)
    board.each_with_index do |row, rowindex|
        row.each_with_index do |col, colindex|

            return ["r#{rowindex}", "c#{colindex}"] if col==number
        end
    end
    return false
end

def check_bingo(board)
    0.upto(4) do |i|
        return true if board.flatten.count("r#{i}") == 5 || board.flatten.count("c#{i}") == 5
    end
    return false
end


input = File.readlines("input.txt")
draw = input[0].chomp.split(",")
drawn = []
winner_draw = nil
input.delete_at(0)
input.delete("\n")

boards=[]
board=[]
marker=[]
input.each_with_index do |row, index| 
    board << row.chomp.split
    if (index + 1) % 5 == 0
        boards << board
        marker << []
        board = []
    end
end



winner = nil
winners = []
draw.each do |number|
    drawn << number
    boards.each_with_index do |board, index|
        val = check_board(board, number)
        marker[index] << val if val
        marker.each_with_index do |board2, index2|
            winner = index2 if check_bingo(board2)
            winners << index2 unless winner.nil?
            winners.uniq!
            winner = nil if winners.length < boards.length
            winner_draw = number unless winner.nil?
            break unless winner.nil? 
        end
        break unless winner.nil?
        
    end
    break unless winner.nil? 
end

sum = boards[winner].flatten - drawn
p sum.map{|el| el.to_i}.sum * winner_draw.to_i
