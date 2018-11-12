# First Way: Mixin
#
# A Module is a collection of methods and constants. The methods in a module may
# be instance methods or module methods. Instance methods appear as methods
# in a class when the module is included, module methods do not. Conversely,
# module methods may be called without creating an encapsulating object,
# while instance methods may not
# source: https://ruby-doc.org/core-2.5.3/Module.html
module A
  def mod_a
    'method called from module A'
  end
end

# the module A is mixid in the class K
# the module_a can be called by K instances
class K
  include A
end

instance = K.new
p instance.mod_a

# checkin the K class ancestors
p K.ancestors




# Second Way: Establishing namespaces with modules and nesting

module C
  CONST = "Module #{self}"
  # module nested inside the module C => C::D
  module D
    CONST = "Module #{self}"

    def self.mod_d
      'method called from module D'
    end
  end
end

p C::D.mod_d
p C::CONST
p C::D::CONST
