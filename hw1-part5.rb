#Part 5: advanced OOP with some metaprogramming
#(Exercise 3.4 from ELLS)
#In lecture we saw how attr_accessor uses metaprogramming to create getters 
#and setters for object attributes on the fly.
#Define a method attr_accessor_with_history that provides the same functionality as 
#attr accessor but also tracks every value the attribute has ever had:

# G Conant



class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name       # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history
    class_eval %Q{
      def #{attr_name}=(new_name)
        if(@#{attr_name}_history == nil)
          @#{attr_name}_history = Array.new
          @#{attr_name}_history.push(nil)
        end
        @#{attr_name}_history.push(new_name)
      end
      
      def #{attr_name}_history
        @#{attr_name}_history
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new  # => #<Foo:0x127e678>
puts f.bar_history.to_s
f.bar = 3  # => 3
puts f.bar_history.to_s
f.bar = :wowzo  # => :wowzo
puts f.bar_history.to_s
f.bar = 'boo!'  # => 'boo!'
result = f.bar_history.to_s # => [nil, 3, :wowzo, 'boo!']
puts "f: " + result


f2 = Foo.new
puts f2.bar_history.to_s
f2.bar = 1
puts f2.bar_history.to_s
f2.bar = "Hi"
puts f2.bar_history.to_s
f2.bar = :weeee
result2 = f2.bar_history
puts "f2: " + result2.to_s