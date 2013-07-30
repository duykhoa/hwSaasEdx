# def combine_anagrams(words)
#   output= Hash.new()
#   words.
#     each do |word|
#       sorted_word = word.downcase.chars.sort.join
#       if !output[sorted_word] 
#         output[sorted_word] =[word]
#       else
#         output[sorted_word]<<word unless output[sorted_word].include?(word)
#       end
#     end
#   # puts "---",output
#   result = []
#   output.each { |key, value| result << value }
#   result
# end

# print combine_anagrams ['a','a','b','b','c']
def combine_anagrams(words)
  hash = Hash.new
  words.each do |str|
     sorted = str.downcase.chars.sort.join
     if (hash[sorted]== nil)
       hash[sorted] = Array.new
     end
     arr = hash[sorted]
     arr[arr.length] = str
     hash[sorted] = arr
     arr = nil
  end
 
  hash.values
end