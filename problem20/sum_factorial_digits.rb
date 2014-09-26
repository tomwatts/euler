#!/usr/bin/env ruby

# Gets the sum of all the digits in the result of n!
# * *Args*    :
#   - +n+ -> 
# * *Returns* :
#   - The sum of all the digits in the result of n!

def sum_factorial_digits(n)
	n_factorial = factorial(n)
	sum = 0
	
	while (n_factorial > 0) do
		sum += n_factorial % 10
		n_factorial /= 10
	end

	return sum
end

def factorial(n)
	if (n <= 1)
		return 1
	else
		return factorial(n - 1) * n
	end

end

n = ARGV[0]
if (n.nil?)
	abort "Usage: #{$0} INTEGER\n"
elsif (false if (Integer(n)) rescue true)
	abort "#{n} is not an Integer\n"
end

n = n.to_i
print "Sum of digits in #{n}!: #{sum_factorial_digits(n)}\n"

