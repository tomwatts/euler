#!/usr/bin/env ruby

sum = 0
sum_of_squares = 0

(1..100).each do |n|
	sum += n
	sum_of_squares += n * n
end

square_of_sum = sum * sum

diff = square_of_sum - sum_of_squares

print diff
