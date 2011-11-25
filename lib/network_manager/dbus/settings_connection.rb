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
  
  def name
    settings['connection']['id']
  end
  
  def update(hash)
    new_settings = hash.dup
    unless new_settings.has_key? 'connection'
      new_settings.merge!(settings)
    end
    call('Update', new_settings)
  end
  
  def name=(new_id)
    hash = settings
    hash['connection']['id'] = new_id
    update(hash)
  end
  
  IPV4_METHOD_AUTO = 'auto'
  IPV4_METHOD_MANUAL = 'manual'
  
  def ip4_auto!
    hash = settings
    hash['ipv4'] = {
      'method' => IPV4_METHOD_AUTO
    }
    update(hash)
  end
  
  def ip4=(new_ip4)
    hash = settings
    hash['ipv4'] = {
      'method' => IPV4_METHOD_MANUAL,
      'addresses' => ['aau', [[NetworkManager::Ip4Helper.dot_decimal_to_arpa(new_ip4).u32, 24, 0]]]
    }
    update(hash)
  end
  
  def ip4
    NetworkManager::Ip4Helper.arpa_u32_to_dot_decimal(settings['ipv4']['addresses'].first.first)
  end
end
