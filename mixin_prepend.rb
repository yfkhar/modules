# Prepend
# Available since Ruby 2, prepend is a bit less known to Rubyists than its
# two other friends. It actually works like include, except that instead
# of inserting the module between the class and its superclass in the chain,
# it will insert it at the bottom of the chain, even before the class itself.
# source: https://medium.com/@leo_hetsch/ruby-modules-include-vs-prepend-vs-extend-f09837a5b073
module Foo
  def my_method
    'Foo'
  end

  def inspect_class
    result = super # retrieve result from instance method inspect_class in Bar.
  end
end

# Mixin with prepend
class Bar
  prepend Foo

  def my_method
    'Bar'
  end

  def inspect_class
    self.class
  end

end

p Bar.new.my_method # => "Foo"
p Bar.new.inspect_class

# Ruby will look into the module methods before looking into the class
p Bar.ancestors # => [Foo, Bar, Object, Kernel, BasicObject]