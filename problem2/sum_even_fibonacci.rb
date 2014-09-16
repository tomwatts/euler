#!/usr/bin/env ruby

def sum_even_fibonacci(limit)
	last = 1
	fib = 2
	sum = 0

	while (fib < limit) do
		print "fib: " + fib.to_s + "\n"
		if ( fib % 2 == 0 )
			sum += fib
		end

		temp = fib
		fib += last
		last = temp
	end

	return sum
end

limit = 4000000
print "Sum of even Fibonacci sequence values less than " + limit.to_s + ": " +
	sum_even_fibonacci(limit).to_s

