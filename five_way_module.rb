# First Way: Mixin
#
# A Module is a collection of methods and constants. The methods in a module may
# be instance methods or module methods. Instance methods appear as methods
# in a class when the module is included, module methods do not. Conversely,
# module methods may be called without creating an encapsulating object,
# while instance methods may not
# source: https://ruby-doc.org/core-2.5.3/Module.html
module A
  VERSION = '0.0.1'.freeze
  # instance method => Class.new.mod_a
  def mod_a
    'instance method called from module A'
  end

  # singleton method => A.k_mod
  def self.version
    VERSION
  end
end

# the module A get mixid in the class K, using the 'include' method
# Notice: mod_a method isn't defined in the class of which the object is an instance
# the module_a can be called by K instances

class K
  include A
end

# checkin the K class ancestors
p K.ancestors

# Check
# class
p K.instance_methods.include? :mod_a
# module
p A.instance_methods.include? :mod_a

# Now K instances can call instance methods of module A
k_instance = K.new
p k_instance.mod_a

# == A::VERSION
p A.version



# Second Way: Nesting modules
# modules encourage modular design: program design that breaks large components
# into smaller ones and lets you mix and match object behaviors.

module C
  CONST = "Module #{self}"
  # module nested inside the module C => C::D
  module D
    CONST = "Module #{self}"

    def mod_d
      'method called from module D'
    end

  end
end

#p C::D.mod_d   # ~> NoMethodError: undefined method `mod_d' for C::D:Module
p C::CONST
p C::D::CONST
