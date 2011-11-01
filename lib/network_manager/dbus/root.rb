class NetworkManager::DBus::Root
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager',
           :object_path => '/org/freedesktop/NetworkManager'

  # Networking state is unknown.
  NM_STATE_UNKNOWN          = 0
  # Networking is inactive and all devices are disabled.
  NM_STATE_ASLEEP           = 10
  # There is no active network connection.
  NM_STATE_DISCONNECTED     = 20
  # Network connections are being cleaned up.
  NM_STATE_DISCONNECTING    = 30
  # A network device is connecting to a network and there is no other available network connection.
  NM_STATE_CONNECTING       = 40
  # A network device is connected, but there is only link-local connectivity.
  NM_STATE_CONNECTED_LOCAL  = 50
  # A network device is connected, but there is only site-local connectivity.
  NM_STATE_CONNECTED_SITE   = 60
  # A network device is connected, with global network connectivity.
  NM_STATE_CONNECTED_GLOBAL = 70
  
  # @return [Array<NetworkManager::DBus::Device>]] devices
  def self.devices
    instance.call('GetDevices').map do |list|
      list.map do |object_path|
        new_device(object_path)
      end
    end.flatten
  end
  
  def self.device_by_interface(interface)
    paths = instance.call('GetDeviceByIpIface', interface)
    paths.empty? ? nil : new_device(paths.first)
  end
  
  def self.internet_connection?
    instance.call('state').first == NM_STATE_CONNECTED_GLOBAL
  end

private

  def self.new_device(object_path)
    NetworkManager::DBus::Device.new object_path
  end

end
