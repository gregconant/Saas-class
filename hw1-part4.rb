#Part 4: Basic OOP
#(a) Create a class Dessert with getters and setters for name and calories.  Define 
#instance methods healthy?, which returns true if a dessert has less than 200 
#calories, and delicious?, which returns true for all desserts.
#(b) Create a class JellyBean that extends Dessert, and add a getter and setter for 
#flavor.  Modify delicious? to return false if the flavor is black licorice (but delicious? 
#should still return true for all other flavors and for all non-JellyBean desserts).

# G Conant


class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def name
    @name
  end
  def calories
    @calories
  end
  def name=(new_name)
    @name = new_name
  end
  def calories=(new_calories)
    @calories = new_calories
  end
  def healthy?
    return (@calories < 200)
  end
  def delicious?
    return true 
  end
end
  
class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def flavor
    @flavor
  end
  def flavor=(new_flavor)
    @flavor = new_flavor
  end
  def delicious?
    if (@flavor.downcase == "black licorice")
      return false
    else
      return super
    end
  end
end


def test_1_basic_dessert_unhealthy #basic dessert that is not healthy
  dessert1 = Dessert.new("Ice Cream", 1200)
  puts "Name #{dessert1.name}"
  puts "Calories #{dessert1.calories}"
  puts "Healthy? #{dessert1.healthy?}"
  puts "Delicious? #{dessert1.delicious?}"
  
  if(dessert1.name == "Ice Cream" and dessert1.calories == 1200 and dessert1.delicious? and not dessert1.healthy?)
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

def test_2_basic_dessert_healthy #basic dessert that is healthy
  dessert1 = Dessert.new("Ice Cream", 199)
  puts "Name #{dessert1.name}"
  puts "Calories #{dessert1.calories}"
  puts "Healthy? #{dessert1.healthy?}"
  puts "Delicious? #{dessert1.delicious?}"
  delicious = dessert1.delicious?
  if(dessert1.name == "Ice Cream" and dessert1.calories == 199 and dessert1.delicious?)
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

def test_3_jelly_bean_delicious # Jelly bean that is delicious
  bean1 = JellyBean.new("Greg's Beans", 100, "Poop")
  puts "Name #{bean1.name}"
  puts "Calories #{bean1.calories}"
  puts "Healthy? #{bean1.healthy?}"
  puts "Delicious? #{bean1.delicious?}"
  puts "Flavor #{bean1.flavor}"
  
  if(bean1.name == "Greg's Beans" and bean1.calories == 100 and bean1.delicious? and bean1.flavor == "Poop")
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

def test_4_jelly_bean_not_delicious # Jelly bean that is not delicious
  bean1 = JellyBean.new("Greg's Beans", 100, "black licorice")
  puts "Name #{bean1.name}"
  puts "Calories #{bean1.calories}"
  puts "Healthy? #{bean1.healthy?}"
  puts "Delicious? #{bean1.delicious?}"
  delicious = bean1.delicious?
  if(bean1.name == "Greg's Beans" and bean1.calories == 100 and not delicious)
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

def test_5_jelly_bean_not_delicious_case_check # Jelly bean that is not delicious (case check)
  bean1 = JellyBean.new("Greg's Beans", 100, "BLACK LICORICE")
  puts "Name #{bean1.name}"
  puts "Calories #{bean1.calories}"
  puts "Healthy? #{bean1.healthy?}"
  puts "Delicious? #{bean1.delicious?}"
  delicious = bean1.delicious?
  if(bean1.name == "Greg's Beans" and bean1.calories == 100 and not delicious)
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

def test_6_dessert_can_set_name_and_calories #basic dessert whose properties are gettable and settable
  dessert1 = Dessert.new("Ice Cream", 1200)
  puts "Name #{dessert1.name}"
  puts "Calories #{dessert1.calories}"
  puts "Healthy? #{dessert1.healthy?}"
  puts "Delicious? #{dessert1.delicious?}"
  dessert1.name="New Name"
  dessert1.calories=100
  puts "  New Name #{dessert1.name}"
  puts "  New Calories #{dessert1.calories}"
  puts "  New Healthy? #{dessert1.healthy?}"
  puts "  New Delicious? #{dessert1.delicious?}"
  if(dessert1.name == "New Name" and dessert1.calories == 100 and dessert1.delicious? and dessert1.healthy?)
    puts "  SUCCESS"
  else
    puts "  FAILURE"
  end
end

test_1_basic_dessert_unhealthy
test_2_basic_dessert_healthy
test_3_jelly_bean_delicious
test_4_jelly_bean_not_delicious
test_5_jelly_bean_not_delicious_case_check
test_6_dessert_can_set_name_and_calories
