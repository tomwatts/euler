#!/usr/bin/env ruby

# Gets the smallest common multiple of all numbers from 1 up to n
# * *Args*    :
#   - +n+ -> 
# * *Returns* :
#   - The smallest common multiple of all numbers from 1 up to n

def smallest_common_multiple(n)

	return 0
end

n = ARGV[0]
if (n.nil?)
	abort "Usage: #{$0} INTEGER\n"
elsif (false if (Integer(n)) rescue true)
	abort "#{n} is not an Integer\n"
end

n = n.to_i
print "Smallest common multiple of all numbers from 1 to #{n}: " + \
	"#{smallest_common_multiple(n)}\n"

