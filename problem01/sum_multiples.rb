#!/usr/bin/env ruby

# Gets the sum of all multiples up to a given limit of numbers in a given array
# * *Args*    :
#   - +numbers+ -> 
#   - +limit+ -> 
# * *Returns* :
#   - The sum of all multiples of the numbers of the given array

def sum_multiples(numbers, limit)
	sum = 0
	(numbers[0]..limit-1).each { |potential_multiple|
		i = 0
		has_been_counted = false
		while (i < numbers.length && !has_been_counted) do
			if (potential_multiple % numbers[i] == 0)
				has_been_counted = true
				sum += potential_multiple
			end
			i += 1
		end
	}

	return sum
end

numbers = [3, 5]
limit = 1000

print "Sum of all multiples of " + numbers.join(", ") + " below " + limit.to_s +
	" is " + sum_multiples(numbers, limit).to_s + "\n"

