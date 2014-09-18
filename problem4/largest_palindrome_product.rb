#!/usr/bin/env ruby

def is_palindrome(n)
	n_digits = 0
	while (n % (10 ** n_digits) != n) do
		n_digits += 1
	end

	left_divisor = 10 ** (n_digits - 1)
	right_divisor = 10

	while (left_divisor > right_divisor) do
		print "left=" + (n / left_divisor).to_s + ", right=" + (n % right_divisor).to_s + "\n"
		if ((n / left_divisor) != (n % right_divisor)) then
			return false
		end
		left_divisor /= 10
		right_divisor *= 10
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

