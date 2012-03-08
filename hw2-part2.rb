#2. iterators, blocks, yield
#Given two collections (of possibly different lengths), we want to get the Cartesian product of the
#sequences—in other words, every possible pair of N elements where one element is drawn from
#each collection.
#For example, the Cartesian product of the sequences 
#a==[:a,:b,:c] and b==[4,5] is:
#a×b == [[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]]

#Create a method that accepts two sequences and returns an iterator that will yield the
#elements of the Cartesian product, one at a time, as a two-element array.
#● It doesn't matter what order the elements are returned in. So for the above example,
#the ordering [[:a,4], [:b,4], [:c,4], [:a,5], [:b,5], [:c,5]] would be
#correct, as would any other ordering.
#● It does matter that within each pair, the order of the elements matches the order in
#which the original sequences were provided. That is, [:a,4] is a member of the
#Cartesian product a×b, but [4,:a] is not. (Although [4,:a] is a member of the
#Cartesian product b×a.]

class CartesianProduct
  include Enumerable

  def initialize(*args)
    return false if args.length != 2
    #print "arg1: " + args[0].to_s + "\r\n"
    #print "arg2: " + args[1].to_s + "\r\n"
    @data = [].push(args[0]).push(args[1])
  end

  def getproduct(data)
    result = []
    data[0].each do |elem1|
      data[1].each do |elem2|
        result.push(Array.new().push(elem1, elem2))
      end
    end
    result
  end

  def each
    if block_given?
      @product = getproduct(@data)
      
      @product.each { |e| yield(e) }
    end
  end 
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)

c = CartesianProduct.new([:a, :b, :c, :d], [2,52])
c.each { |elt| puts elt.inspect }
