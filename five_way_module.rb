require_relative 'external_module'
# First Way: Mixin
#
# A Module is a collection of methods and constants. The methods in a module may
# be instance methods or module methods. Instance methods appear as methods
# in a class when the module is included, module methods do not. Conversely,
# module methods may be called without creating an encapsulating object,
# while instance methods may not
# source: https://ruby-doc.org/core-2.5.3/Module.html
module A
  # A::VERSION
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

# Inspecting nesting
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
  # C::CONST
  CONST = "Module #{self}".freeze
  # module nested inside the module C => C::D
  module D
    # C::D::CONST
    CONST = "Module #{self}".freeze

    def self.mod_d
      'method called from module D'
    end

  end
end

p C::D.mod_d
p C::CONST
p C::D::CONST

# Third Way: Namespace
module E
  # E::WAY => 'Namespace'
  WAY = 'Namespace'.freeze

  # E.way => 'Namespace'
  def self.way
    WAY
  end

  # E::Y
  class Y
    def my_method
      Module.nesting
      'y_method called'
    end
  end

  class X

    def my_method
      Module.nesting
      'x_method called'
    end
  end

  # E::F
  module F
    NAME = self.name.freeze
  end
end

module E::J
  NAME = self.name.freeze
end

p E::WAY
p E::Y.new.my_method
p E::X.new.my_method

p E::J::NAME
