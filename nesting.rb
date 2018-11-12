# Second Way: Nesting modules
# modules encourage modular design: program design that breaks large components
# into smaller ones and lets you mix and match object behaviors.

module Foo
  # Foo::NAME
  NAME = "Module #{self}".freeze
  # module nested inside the module Foo => Foo::Bar
  module Bar
    # Foo::Bar::NAME
    NAME = "Module #{self}".freeze

    def self.mod_d
      'method called from module D'
    end

  end
end

p Foo::Bar.mod_d
p Foo::NAME
p Foo::Bar::NAME
