require File.join(File.expand_path(File.dirname(__FILE__)), '../lib/network_manager')

# list ipv4 addresses for each device
NetworkManager.devices.each do |device|
  puts " #{device['Interface']} | #{device.ip4_address}"
end
