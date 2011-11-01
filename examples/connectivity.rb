require File.join(File.expand_path(File.dirname(__FILE__)), '../lib/network_manager')

puts "Internet Connection: #{NetworkManager.internet_connection? ? 'yes' : 'no'}"

puts "States are described as NM_STATE_... in NetworkManager::DBus::Root"
puts "State is == #{NetworkManager::DBus::Root.instance.object.state}"
 