class NetworkManager::DBus::SettingsConnection
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Settings.Connection'
end
