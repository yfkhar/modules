# Mixin using extend
#
module Foo
  def mod_method
    'Foo'
  end
end

# add Module methods as Class Methods using 'extend'
class Bar
  extend Foo
end

p Bar.mod_method

p Bar.ancestors

# Can also extend a class or object using object.extend(Module)
# Bar.extend(Foo)