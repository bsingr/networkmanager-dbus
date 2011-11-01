class NetworkManager::DBus::ActiveConnection
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Connection.Active'
end
