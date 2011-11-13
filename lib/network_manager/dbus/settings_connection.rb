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
  
  def update(new_settings)
    call('Update', new_settings)
  end
  
  def name
    settings['connection']['id']
  end
  
  def name=(new_id)
    hash = settings
    hash['connection']['id'] = new_id
    update(hash)
  end
end
