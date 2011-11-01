module NetworkManager::DBus
  # require all .rb files from lib/network_manager/dbus
  Dir.glob(File.join(File.dirname(__FILE__), "dbus/*.rb")).each do |p|
    require p
  end
end
