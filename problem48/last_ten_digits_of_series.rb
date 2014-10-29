#!/usr/bin/env ruby

# Gets the sum of all primes less than a given number
# * *Args*    :
#   - +n+ -> 
# * *Returns* :
#   - The sum of all primes less than n

def is_prime(n)
	if ( n <= 1 )
		return false
	end

	(2..(Math.sqrt(n).floor)).each do |divisor|
		if ( n % divisor == 0 )
			return false
		end
	end

	return true
end

def sum_of_primes(n)
	sum = 0
	(1..n).each do |x|
		sum += x if (is_prime(x))
		print "x=#{x}, sum=#{sum}\n" if (x % 100000 == 0)
	end

	return sum
end

n = ARGV[0]
if (n.nil?)
	abort "Usage: #{$0} INTEGER\n"
elsif (false if (Integer(n)) rescue true)
	abort "#{n} is not an Integer\n"
end

n = n.to_i

start_time = Time.now
sum = sum_of_primes(n)
end_time = Time.now

print "Sum of all primes less than #{n}: #{sum}\nElapsed time: " + \
	"#{end_time - start_time} s"

