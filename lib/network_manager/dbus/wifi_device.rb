class NetworkManager::DBus::WifiDevice
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Device.Wireless'

  property 'HwAddress'
end
