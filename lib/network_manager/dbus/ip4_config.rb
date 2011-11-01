class NetworkManager::DBus::Ip4Config
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.IP4Config'
end
