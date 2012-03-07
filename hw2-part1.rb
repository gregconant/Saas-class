#HW 2: More ruby, and some rails

#1. open classes, metaprogramming, duck typing
  #a) [ELLS ex. 3.11] Extend the currency-conversion example from lecture so that you can write
      #5.dollars.in(:euros)
      #10.euros.in(:rupees)
      #etc.
      #● You should support the currencies 'dollars', 'euros', 'rupees' , 'yen' where the
      #conversions are: rupees to dollars, multiply by 0.019; yen to dollars, multiply by 0.013;
      #euro to dollars, multiply by 1.292.
      #● Both the singular and plural forms of each currency should be acceptable, e.g.
      #1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.
      #You can use the code shown in lecture as a starting point if you wish; 
      # it is at http://pastebin.com/#agjb5qBF

      
      # metaprogramming to the rescue!

      # G Conant
      
require "test/unit"

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.000}
  def in(sym)
    singular_currency = sym.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      if(singular_currency == "dollar")
        self * @@currencies[singular_currency]
      else
        self / @@currencies[singular_currency]
      end
    end
  end
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      if(singular_currency == "dollar")
        self / @@currencies[singular_currency]
      else
        self * @@currencies[singular_currency]
      end
    else
      super
    end
  end

end

class TestHW2Part1a < Test::Unit::TestCase
  def test_rupees
    input = 1000
     assert_equal((input*0.019), input.rupees)
  end
  def test_yen_in_dollars
    input = 1000
    assert_equal(input*0.013, input.yen.in(:dollars))
  end
  def test_dollars_in_yen
    input = 13
    assert_equal(13/0.013, input.dollars.in(:yen))
  end
  def test_dollars_in_euro
    input = 5
    assert_equal(input / 1.292, input.dollars.in(:euro))
  end
  def test_euro_in_dollars
    input = 3
    assert_equal(3 * 1.292, input.euro.in(:dollars))
  end
  def test_yen_in_euro
    input = 1000
    assert_equal((input * 0.013 / 1.292), input.yen.in(:euro))
  end
  def test_dollars_in_rupees
    input = 500
    assert_equal(input / 0.019, input.dollars.in(:rupees))
  end
 
end

  #b) Adapt your solution from HW 1 "palindromes" question so that instead of writing palindrome?
      #("foo") you can write "foo".palindrome? HINT: this should require fewer than 5 lines of code.

class String
  def palindrome?
  sanitized = self.downcase.gsub(/\W/, '')
  (sanitized == sanitized.reverse)
  end
end

class TestHW2Part1b < Test::Unit::TestCase
  def test_not_palindrome
    assert_equal(false, "foo".palindrome?)
  end
  def test_palindrome_with_punctuation
    assert_equal(true, "A man, a plan, a canal -- Panama".palindrome?)  
  end
  def test_palindrome_with_punctuation_2
    assert_equal(true, "Madam, I'm Adam!".palindrome?)
  end
  def test_not_palindrome_longer
    assert_equal(false,"Abracadabra".palindrome?)
  end

end

  #c) Adapt your palindrome solution so that it works on Enumerables. That is:
      #[1,2,3,2,1].palindrome? # => true
      #(It's not necessary for the collection's elements to be palindromes themselves--only that the
      #top-level collection be a palindrome.) HINT: this should require fewer than 5 lines of code.
      #Although hashes are considered Enumerables, your solution does not need to make sense for
      #hashes (though it should not error)

module Enumerable
  def palindrome?
    if(self.is_a?(Hash))
      # not sure what to do here
      return true
    end
    #if(self.is_a?(Array))
      self == self.reverse
    #else
    #  self.each do |item|
    #    puts item
    #    puts item.palindrome?
    #    item.palindrome?
    #  end
    #end
  end
end

class TestHW2Part1c < Test::Unit::TestCase
  def test_enumerable_is_palindrome
    assert_equal(true, [1,2,3,2,1].palindrome?)
  end 
  def test_enumerable_is_not_palindrome
    assert_equal(false, [1,2,3,4,5].palindrome?)
  end 
  def test_hash_does_not_error
    assert_equal(true, {:first => 1, :second => 2, :third => 3}.palindrome?)
  end
  def test_enumerator_is_palindrome
    assert_equal(true, "If I had a hi-fi".chars.palindrome?)  #testing Non-array enumerable)
  end
end
