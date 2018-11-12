# add the current directory to default load path
# instead of using require './lib/external_module.rb'
$LOAD_PATH.unshift(File.expand_path(__dir__))
require 'lib/external_module'

class Foo
  include ExternalModule
end

p Foo::NAME


