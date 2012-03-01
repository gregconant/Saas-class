#HW 1: Ruby calisthenics
# https://www.coursera.org/saas/assignment/view?assignment_id=1

#In this homework you will do some simple programming exercises to get familiar with
#the Ruby language. We will provide detailed automatic grading of your code.
#NOTE: For all questions involving words or strings, you may assume that the
#definition of a "word" is "a sequence of characters whose boundaries are matched by
#the \b construct in Ruby regexps."
#Part 1: fun with strings
#(a) Write a method that determines whether a given word or phrase is a palindrome,
#that is, it reads the same backwards as forwards, ignoring case, punctuation, and
#nonword characters. (a "nonword character" is defined for our purposes as "a
#character that Ruby regexps would treat as a nonword character".) Your solution
#shouldn't use loops or iteration of any kind. You will find regular-expression syntax
#very useful; it's reviewed briefly in the book, and the website rubular.com lets you try
#out Ruby regular expressions "live".

#G Conant, 2012 Feb 29

def palindrome? (input)
  sanitized = input.downcase.gsub(/\W/, '')
  (sanitized == sanitized.reverse)
end
#puts palindrome?("A man, a plan, a canal -- Panama")
#palindrome?("A man, a plan, a canal -- Panama")
#palindrome?("Madam, I'm Adam!")
#palindrome?("Abracadabra")


#(b) Given a string of input, return a hash whose keys are words in the string and
#whose values are the number of times each word appears. Don't use forloops.
#Nonwords should be ignored. Case shouldn't matter. A word is defined as a
#string of characters between word boundaries. (Hint: the sequence \b in a Ruby
#regexp means "word boundary".)
#Example:
#   count_words("A man, a plan, a canal -- Panama")
   
#    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1,
#    'plan' => 1}
#    count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' =>
#    2}


def count_words(input)
 words = input.downcase.split(/\b/)
 results = Hash.new(0)
 words.each do |w|
   if w =~ /\w/
    results[w] += 1  
   end
 end 
 results
end

#puts count_words("A man, a plan, a canal -- Panama")
#puts count_words("Doo bee doo bee doo")
#puts count_words("there is UPPER upper case")
