class NetworkManager::DBus::Settings
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Settings',
             :object_path => '/org/freedesktop/NetworkManager/Settings'
  
  def self.connections
    instance.object.ListConnections.map do |list|
      list.map do |object_path|
        ::NetworkManager::DBus::SettingsConnection.new(object_path)
      end
    end.flatten
  end
  
  def hostname=(new_name)
    object.SaveHostname(new_name)
  end
  
  def hostname
    properties['Hostname']
  end
end
