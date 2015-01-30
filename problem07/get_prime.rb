#!/usr/bin/env ruby

def is_prime(n)
	# anything over n/2 won't divide into n
	half_n = n / 2

	(2..half_n).each do |d|
		if(n % d == 0)
			return false
		end
	end

	return true
end

def get_nth_prime(n)
	primes = [2]
	i = 3

	while (primes.count < n)
		primes.push(i) if (is_prime(i))
		# Count by two to skip checking evens
		i += 2
	end

	primes.pop
end

n = 10001
print "The #" + n.to_s + " prime is " + get_nth_prime(n).to_s

