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
  puts (sanitized == sanitized.reverse)
end

palindrome?("A man, a plan, a canal -- Panama")
palindrome?("Madam, I'm Adam!")
palindrome?("Abracadabra")
