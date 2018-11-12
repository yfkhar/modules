# Namespace
# A Ruby module is nothing more than a grouping of objects under a single name.
# The objects may be constants, methods, classes, or other modules.
# When a module is used as a container for objects, it’s called a namespace
module Foo
  # E::WAY => 'Namespace'
  TYPE = 'Namespace'.freeze

  # Foo.type => 'Namespace'
  def self.type
    TYPE
  end

  # Foo::Bar
  class Bar
    # Foo::Bar.new.my_method
    # => [Foo::Bar, Foo]
    # => 'bar_method called'
    def my_method
      p Module.nesting
      'bar_method called'
    end
  end

  # Foo::Baz
  class Baz
    # Foo::Bar.new.my_method
    # => [Foo::Baz, Foo]
    # => 'x_method called'
    def my_method
      p Module.nesting
      'baz_method called'
    end
  end

  # Foo::Qux
  module Qux
    # Foo::Qux::NAME
    # => "Foo::Qux"
    NAME = self.name.freeze
  end
end

# Inspecting ancestors
p Foo::Baz.ancestors
p Foo::Bar.ancestors

# Compact style
module Foo::Quux
  # Foo::Quux::NAME
  # => "Foo::Quux"
  NAME = self.name.freeze
end


p Foo::Quux.ancestors
