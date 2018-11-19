module Car
  # syntax autoload(:Module, 'filename.rb')
  autoload(:Engine, './module_to_load.rb')
  # The first call to autoload? :Engine returns the "./module_to_load.rb" file path.
  p autoload?(:Engine)
  # Then the Engine module is loaded via a loading of the b.rb file.

  puts "The Engine module isn't yet loaded!"

  Engine # call#load module

  puts 'The Engine module has been successfully loaded!'

  p autoload?(:Engine) # returns nil because the Engine module is already loaded.

  # call Engine#start Engine#stop singleton methods
  Engine.start
  Engine.stop
end

# >> "./module_to_load.rb"
# >> The Engine module isn't yet loaded!
# >> The Engine module is loading!
# >> The Engine module has been successfully loaded!
# >> nil
# >> Engine starts
# >> Engine stops