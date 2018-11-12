p $LOAD_PATH.unshift(File.expand_path(__dir__))
require 'lib/external_module'

class Foo
  include ExternalModule
end

p Foo::NAME


