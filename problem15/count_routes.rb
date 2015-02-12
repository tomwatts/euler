#!/usr/bin/env ruby

# Gets the total number of routes on an n by n grid from the top left corner to
# the bottom right corner by being only able to make right or downward moves.
# * *Args*    :
#   - +n+ -> Dimension of the grid in number of squares
# * *Returns* :
#   - The total number of routes

def count_routes(n)

	return 0
end

n = ARGV[0]
if (n.nil?)
	abort "Usage: #{$0} INTEGER"
elsif (false if (Integer(n)) rescue true)
	abort "#{n} is not an Integer"
end

n = n.to_i
puts "The total number of routes on an #{n} by #{n} grid: #{count_routes(n)}"

