x=y=aim=0
File.readlines("input.txt").each do |value|
    command,interval = value.split
    if command.eql? "forward"
        x+=interval.to_i
        y+=(aim*interval.to_i)
    elsif command.eql? "up"
        aim-=interval.to_i
    elsif command.eql? "down"
        aim+=interval.to_i
    end
end
p x*y