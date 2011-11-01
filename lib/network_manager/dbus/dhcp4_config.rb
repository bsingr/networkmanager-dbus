class NetworkManager::DBus::Dhcp4Config
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.DHCP4Config'
end
