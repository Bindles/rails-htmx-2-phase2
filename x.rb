def find_the_difference(s, t)
  t.each_char.with_index { |char, i| return char if !s.include?(char) }
end

def find_the_difference(s, t)
  t.each_char.with_index { return _1 if !s.include?(_1) }
end


puts find_the_difference("abc", "abcd")