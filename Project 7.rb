# Project 7

#1. Create a ruby class that uses “class variables” and “instance variables”
  
# - Class variables are easy. Simply create your new class, use the @@ to denote the variable as class level and add a getter method like so:

class Polygon
  @@sides = 10
    def self.sides
     @@sides
    end
end

puts Polygon.sides # and it will return => 10

# The issue with class variables is inheritance.
# Let’s use the subclass Polygon with Triangle to demonstrate what this really does and so that we can see the difference ,like so:

class Triangle < Polygon
  @@sides = 3
end

puts Triangle.sides # and it will return  => 3
puts Polygon.sides # and it will return => 3

# So now take a look at it closely , above Polygon’s sides was set to 10? When you set a class variable,
# you set it for the superclass and all of the subclasses.

# - Instance Variables adds the side attribute accessor methods to the class level rather than the instance level.
# What we are left with is a class level instance variable. So now let’s try inheritance:
  
class Triangle < Polygon
  @sides = 3
end

puts Triangle.sides # and it will return => 3
puts Polygon.sides # and it will return => 8

#It demonstrates three of the ways that class variables cause trouble: such as
#  - The behave differently from instance variables if they are missing.
#  - They are shared across an inheritance hierarchy in a counterintuitive way.
#  - They require a new syntax, when the instance variable syntax is perfect for the task.
  
  
  
#2. Create a ruby class that uses “class methods” and “instance methods”
  
#  ok so first let s see the definition :
#  - Class methods are methods that are called on a class
#  - Instance methods are methods that are called on an instance of a class

#Let s see the example to see the different from them:

class Foo
  def self.bar
    puts 'class method'
  end
  
  def baz
    puts 'instance method'
  end
end

Foo.bar # this will return => "class method"
Foo.baz # this will return => NoMethodError: undefined method ‘baz’ for Foo:Class

Foo.new.baz # this will return  => instance method
Foo.new.bar # this will return  => NoMethodError: undefined method ‘bar’ for #<Foo:0x1e820>

#Ok so let us see the difference from the example we showed above :
# - bar is a class method, so calling bar on the Foo class works fine. baz is an instance method,
#   so calling baz on the Foo class raises a NoMethodError. Then, on the next couple lines, we
#   call both methods on an instance of Foo (Foo.new).


# 3. Create a class that implements a “private” method
  
#let s create a class of a person and we ll take it there to be a private methods:
#  class << self opens up self's singleton class, so that methods can be redefined for the current self object. This is used to define class/module ("static") method. Defining private method over there only gives you private class method.

# Microsoft Windows [Version 6.2.9200]
# (c) 2012 Microsoft Corporation. All rights reserved.

# C:\Users\Sedinirina>irb --simple-prompt
>> class Person
>>   def self.get_name
>>     persons_name
>>   end
>>   class << self
>>     private
>>       def persons_name
>>         "Steve"
>>       end
>>   end
>> end
# => nil
>> puts "Hey, " + Person.get_name
# Hey, Steve
# => nil
>> puts "Hey, " + Person.persons_name #=> raises "private method `persons_name' called for Person:Class (NoMethodError)"
#NoMethodError: private method `persons_name' called for Person:Class
#        from (irb):13
#        from C:/Ruby193/bin/irb:12:in `<main>'

# the class << self opens up self's singleton class, so that methods
# can be redefined for the current self object. This is used to
# define class/module ("static") method. Defining private method
# over there only gives you private class method.

# The reason why we use a private method because a method cannot be called with an explicit
# receivers, e.g. some_instance.private_method(value).
# So even though the implicit receiver is self, in that
# example we explicitly use self so the private methods are not accessible.

# 4. Create a class that implements a “protected” methods.


# C:\Users\Sedinirina>irb --simple-prompt
>> class Person
>>    def self.get_name
>>     persons_name
>>    end
>>    class << self
>>      protected
>>        def persons_name
>>          "Steve"
>>        end
>>    end
>> end
# => nil
>> puts "Hey, " + Person.get_name
# Hey, Steve
# => nil
>> puts "Hey, " + Person.persons_name
#NoMethodError: protected method `persons_name' called for Person:Class
#        from (irb):13
#        from C:/Ruby193/bin/irb:12:in `<main>'
#>>

# - Why use protected methods?

# We use the protected methods so that the method can only be accessed from that class or any of its subclasses.

# 5. Read up on ruby class inheritance i.e. (http://rubylearning.com/satishtalim/ruby_inheritance.html)

# --------I just did read up on ruby the class inheritance---------

# 6. Create 3 classes. They should be named “Vehicle”, “Car”, “Truck”. Car and Truck should “inherit” from “Vehicle”


# C:\Users\Sedinirina>irb --simple-prompt
>> class Vehicule
>>   def color
>>     puts "the famous color 2013 is green dark."
>>   end
>>   def  Max_speed
>>     puts "limited to 275 km/h."
>>   end
>> end
# => nil
>> class Car < Vehicule
>>   def Max_speed
>>     puts "I'll go for 300km/h"
>>   end
>> end
# => nil
>> class Truck < Vehicule
>>   def Max_speed
>>     puts "Sorry. I'd rather die."
>>   end
>> end
# => nil
>> T = Truck.new
# => #<Truck:0x23f4ba0>
>> T.color
# the famous color 2013 is green dark.
# => nil
>> T.Max_speed
# Sorry. I'd rather die.
# => nil
>> C = Car.new
# => #<Car:0x2427c48>
>> C.color
# the famous color 2013 is green dark.
# => nil
>> C.Max_speed
# I'll go for 300km/h
# => nil
# >>

# 7. Create a method in Vehicle and then “override” it in Car and Truck. Why would you override methods?

# the reason why we use override method because it allows a subclasses (which is Car and Truck)
# to provide a specific implementation of a method that is already provided by one of its
# superclass ( which is the Vehicule ). The implementation in the 
# subclass overrides (replaces) the implementation in the superclass.

# C:\Users\Sedinirina>irb --simple-prompt
>> class Vehicule
>>   def color
>>     puts "the famous color 2013 is green dark."
>>   end
>>   def  Max_speed
>>     puts "limited to 275 km/h."
>>   end
>> end
# => nil
>> class Car < Vehicule
>>   def Max_speed
>>     puts "I'll go for 300km/h"
>>   end
>> end
# => nil
>> class Truck < Vehicule
>>   def Max_speed
>>     puts "Sorry. I'd rather die."
>>   end
>> end
# => nil
>> T = Truck.new
# => #<Truck:0x23f4ba0>
>> T.color
# the famous color 2013 is green dark.
# => nil
>> T.Max_speed
# Sorry. I'd rather die.
# => nil
>> C = Car.new
# => #<Car:0x2427c48>
>> C.color
# the famous color 2013 is green dark.
# => nil
>> C.Max_speed
# I'll go for 300km/h
# => nil
# >>

# The method Max_speed in class Car and Truck override the method Max_speed in class Vehicule.


# 8. Show an example of using “super” in your overrided methods.


# C:\Users\Sedinirina>irb --simple-prompt
>> class Vehicule
>>   def color
>>     "the famous color 2013 is green dark."
>>   end
>>   def  Max_speed
>>     "limited to 275 km/h"
>>   end
>> end
# => nil
>> class Car < Vehicule
>>   def Max_speed
>>     super + " ? I disagree because I love speed ,it's in my blood"
>>   end
>> end
# => nil
>> class Truck < Vehicule
>>   def Max_speed
>>   super + " ? should be less way far such as 60Km/h"
>>   end
>> end
=> nil
# >>
?> T = Truck.new
# => #<Truck:0x272d408>
>> T.color
# => "the famous color 2013 is green dark."
>> T.Max_speed
# => "limited to 275 km/h ? should be less way far such as 60Km/h"
# >>
?> C = Car.new
# => #<Car:0x27512a0>
>> C.color
# => "the famous color 2013 is green dark."
>> C.Max_speed
# => "limited to 275 km/h ? I disagree because I love speed ,it's in my blood"
# >>

# - Why use super?

# The reason why we use super because Within the body of a method, a call to super
# acts just like a call to that original method. There are several ways that super handles arguments is as follows:

# - When you invoke super with no arguments Ruby sends a message to
# the parent of the current object, asking it to invoke a method of
# the same name as the method invoking super. It automatically forwards
# the arguments that were passed to the method from which it's called.
# - Called with an empty argument list - super()-it sends no arguments to
# the higher-up method, even if arguments were passed to the current method.
# - Called with specific arguments - super(a, b, c) - it sends exactly those arguments.