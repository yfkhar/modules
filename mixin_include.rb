# Mixin using include
# A Mixin is basically just a Module that is included into a Class. When you
# “mixin” a Module into a Class, the Class will have access to
# the methods of the Module.
module Foo
  # A::VERSION
  VERSION = '0.0.1'.freeze

  # instance method => Class.new.mod_a
  def mod_foo
    'instance method called from module Foo'
  end

  # singleton method => A.k_mod
  def self.version
    VERSION
  end
end

# the module Foo get mixed in the class Bar, using the 'include' method
# Notice: mod_foo method isn't defined in the class of which the object is an instance
class Bar
  include Foo
end

# checkin the Bar class ancestors
p Bar.ancestors # => [Bar, Foo, Object, Kernel, BasicObject]

# Inspecting nesting for
# class
p Bar.instance_methods.include? :mod_foo # => true
# module
p Foo.instance_methods.include? :mod_foo # => true

# Now K instances can call instance methods of module Foo
k_instance = Bar.new
p k_instance.mod_foo # => "instance method called from module Foo"

# == A::VERSION
p Foo.version # => "0.0.1"