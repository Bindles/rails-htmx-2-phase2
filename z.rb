def greeting
  p "hi"
  
  def cool
    puts "cool"
  end
  
  cool
end

greeting


# @param {String} s
# @param {String} t
# @return {Character}
# def find_the_difference(s, t)
#     t.each_char.with_index do |a, i|
#       puts "#{a} vs #{s[i]}" if s.include?(a)
#       return a if !s.include?(a)
#     end
# end

# def find_the_difference(s, t)
#   s_count = Hash.new(0)

#   s.each_char { |char| s_count[char] += 1 }

#   t.each_char do |char|
#     s_count[char] -= 1
#     return char if s_count[char] < 0
#   end
# end


def find_the_difference(s, t)
  # Step 1: Map the sum of codepoints for each character in strings s and t
  codepoints_s = s.codepoints.sum
  codepoints_t = t.codepoints.sum

  puts "Codepoints for s: #{codepoints_s}"
  puts "Codepoints for t: #{codepoints_t}"

  # Step 2: Subtract the sum of codepoints for s from the sum of codepoints for t
  difference = codepoints_t - codepoints_s
  puts "Difference: #{difference}"

  # Step 3: Convert the resulting difference (a single integer) back to a character
  added_char = difference.chr

  puts "Added character: #{added_char}"

  # Step 4: Return the added character
  added_char
end

# Example usage
result = find_the_difference("abcd", "abcde")
puts "Result: #{result}"

# puts find_the_difference('abc', 'abcd')