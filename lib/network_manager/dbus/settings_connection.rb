class NetworkManager::DBus::SettingsConnection
  class SecretsCacheInvalidError < StandardError; end
  
  include DBusInterface::Object
  no_properties!
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Settings.Connection'
  
  def settings
    call('GetSettings').first
  end
  
  def secrets(name = '')
    call('GetSecrets', name)
  rescue DBus::Error => e
    raise SecretsCacheInvalidError.new("Secrets cache invalid (#{e})")
  end
end
