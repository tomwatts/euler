#!/usr/bin/env ruby

def decipher_file(encoded_file)

	words = Hash.new
	print "Loading dictionary..."
	File.new("words").each().each do |line|
		words[line.chop] = nil
	end
	puts "done!"

	text = File.new(encoded_file).read()
	tokens = text.split(",")
	decoded_message = ""

	("aaa".."zzz").each do |key|
		decoded_message = ""
		i = 0
		tokens.each do |token|
			decoded_token = key[i].ord ^ token.to_i
			decoded_message += decoded_token.chr
			i = (i + 1) % key.length()
		end

		if (is_english(decoded_message, words, 90))
			return decoded_message 
		end
	end

	return nil
end

def is_english(text, english_dictionary, threshold)
	n_words = 0
	n_english_words = 0

	# Strip anything that's not a letter
	text = text.downcase.gsub(/[^a-z'\s]/i, '')

	text.split(" ").each do |token|
		n_words += 1
		if (english_dictionary.has_key?(token))
			n_english_words += 1
		end
	end

	percent_english = 100 * n_english_words / n_words.to_f
	if (percent_english > threshold)
		return true
	end

	return false
end

def sum_string(text)
	sum = 0

	text.each_char do |c|
		sum += c.ord
	end

	return sum
end

file_name = ARGV[0]
if (file_name.nil?)
	abort "Usage: #{$0} FILENAME"
elsif (!File.exist?(file_name))
	abort "#{file_name} does not exist"
end

start_time = Time.now
decoded_message = decipher_file(file_name)
decoded_message_sum = sum_string(decoded_message)
end_time = Time.now

puts "Decoded message: #{decoded_message}"
puts "Decoded message sum: #{decoded_message_sum}"
puts "Elapsed time: #{end_time - start_time} s"

