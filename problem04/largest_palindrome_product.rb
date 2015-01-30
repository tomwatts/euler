#!/usr/bin/env ruby

def is_palindrome(n)
	n_array = []
	
	while (n > 0) do
		#print "n=#{n}\n"
		n_array.push(n % 10)
		n /= 10
	end

	i = 0

	until (i >= (n_array.count - i)) do
		#print "i=#{i}, -i=#{-i}\n"
		if (n_array[i] != n_array[-i - 1])
			return false
		end
		i += 1
	end

	return true
end

def get_largest_palindrome_product(digits)
	max = 10 ** digits - 1
	min = 10 ** (digits - 1)
	palindrome_products = []

	max.downto(min) do |n|
		n.downto(min).each do |m|
			product = n * m
			palindrome_products.push(product) if (is_palindrome(product))
		end
	end

	if (palindrome_products.count <= 0) then
		return -1
	else
		return palindrome_products.sort.pop
	end

end

n_digits = 3
largest_palindrome_product = get_largest_palindrome_product(n_digits)

if (largest_palindrome_product >= 0) then
	print "Largest palindrome product for " + n_digits.to_s + " digit multiples" +
		" is " + largest_palindrome_product.to_s
else
	# We should never get here
	print "Could not find a palindrome product for " + n_digits.to_s + " digit " +
		"multipliers!"
end

