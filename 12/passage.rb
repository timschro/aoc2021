lines = File.readlines("input.txt").map { |l| l.chomp.split('-').map(&:to_sym) }

nodes = {}
lines.each do |a, b|
  nodes[a] ||= []
  nodes[a] << b
  nodes[b] ||= []
  nodes[b] << a 
end


def find_paths(current, nodes, duplicate_node=nil, visited_points=[], all_paths=[])
  return all_paths << visited_points + [:end] if current == :end
  nodes[current].each do |node|
    if visited_points.include?(node) && node.downcase == node
      next unless node == duplicate_node && visited_points.count(node) == 1
    end
    find_paths(node, nodes, duplicate_node, visited_points + [current], all_paths)
  end  
  return all_paths
end

# part 1
p find_paths(:start, nodes).size

# part 2
paths = []
nodes.keys.select { |node| node.downcase == node && ![:start, :end].include?(node)}.each do |duplicate_node|
  paths += find_paths(:start, nodes, duplicate_node)
end
p paths.uniq.size