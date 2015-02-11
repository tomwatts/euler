#!/usr/bin/env ruby

def decipher_file(encoded_file)

	words = Hash.new
	print "Loading dictionary..."
	File.new("words").each().each do |line|
		words[line.chop] = nil
	end
	print "done!\n"

	text = File.new(encoded_file).read()
	tokens = text.split(",")
	decoded_message = ""
	decoded_message_sum = 0

	('aaa'..'zzz').each do |key|
	#('aaa'..'aad').each do |key|
		#print "Current key: #{key}\n"
		decoded_message = ""
		i = 0
		tokens.each do |token|
			#print "#{key[i].ord} ^ #{token.to_i} = #{key[i].ord ^ token.to_i}\n"
			decoded_token = key[i].ord ^ token.to_i
			decoded_message += decoded_token.chr
			decoded_message_sum += decoded_token.to_i
			#if (decoded_token == " ")
				# TODO: check to see if message so far is english
			#end
			i = (i + 1) % key.length()
		end

		return decoded_message if (is_english(decoded_message, words, 50))
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
		else
			print "#{token} is not in the english dictionary\n"
		end
	end

	percent_english = 100 * n_english_words / n_words.to_f
	if (percent_english > threshold)
		print "percent_english: #{percent_english}\n"
		print "text: #{text}\n"
		return true
	end

	return false
end

file_name = ARGV[0]
if (file_name.nil?)
	abort "Usage: #{$0} FILENAME\n"
elsif (!File.exist?(file_name))
	abort "#{file_name} does not exist\n"
end

start_time = Time.now
result = decipher_file(file_name)
end_time = Time.now

print "Elapsed time: #{end_time - start_time} s\n"
print "Decoded message: #{result}\n"

