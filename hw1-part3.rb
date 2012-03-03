
#Part 3: anagrams
#An anagram is a word obtained by rearranging the letters of another word.  For 
#example, "rats", "tars" and "star" are an anagram group because they are made up 
#of the same letters.
#Given an array of strings, write a method that groups them into anagram groups and 
#returns the array of groups.  Case doesn't matter in classifying string as anagrams 
#(but case should be preserved in the output), and the order of the anagrams in the 
#groups doesn't matter.
#Example:
# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 
#'scream'] 
#  => output:  [["cars", "racs", "scar"], ["four"], ["for"], 
#["potatoes"], ["creams", "scream"]]
# HINT: you can quickly tell if two words are anagrams by sorting their
#  letters, keeping in mind that upper vs lowercase doesn't matter

# G Conant


def getSortedWord(word)
  if(word.is_a?(String))
    word.downcase.chars.to_a.sort.join("")
  end
end

def combine_anagrams(words)
  anagrams = Hash.new
  #puts words
  words.each do |word|
   sortedWord = getSortedWord(word)
   #puts "sorted: " + sortedWord
   if(!anagrams.has_key?(sortedWord))
     anagrams[sortedWord] = []
   end
   anagrams[(sortedWord)].push(word)
   
  #  w.each do |letters|
   #   print w + "\r\n"
    #if(w.downcase)    

  end
  #anagrams.each do |key, value|
  #  puts key.to_s + " => " + value.to_s
  #end
  
  anagrams.values.to_a
    

end


result1 = combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])

if(result1.to_s == [["cars", "racs", "scar"], ["for"],["potatoes"], ["four"], ["creams", "scream"]].to_s)
  puts "Success"
else
  puts "Fail: result = " + result1.to_s
end

# verify that caps don't matter when checking anagrams
result2 = combine_anagrams(['caRs', 'for', 'potatoes', 'racs', 'four', 'SCAR', 'cREAms','scream'])

if(result2.to_s == [["caRs", "racs", "SCAR"], ["for"], ["potatoes"], ["four"], ["cREAms", "scream"]].to_s)
  puts "Success"
else
  puts "Fail: result = " + result2.to_s
end
