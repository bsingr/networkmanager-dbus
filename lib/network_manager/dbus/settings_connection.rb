class NetworkManager::DBus::SettingsConnection
  class SecretsCacheInvalidError < StandardError; end
  
  HW_TYPE_ETHERNET = '802-3-ethernet'
  HW_TYPE_WIRELESS = '802-11-wireless'
  HW_TYPE_BLUETOOTH = 'bluetooth'
  SW_TYPE_VPN = 'vpn'
  SW_TYPE_BRIDGE = 'bridge'
  
  include DBusInterface::Object
  no_properties!
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.Settings.Connection'
  
  def settings
    call('GetSettings').first
  end
  
  def delete
    call('Delete')
  end
  
  def secrets(name = '')
    call('GetSecrets', name)
  rescue DBus::Error => e
    raise SecretsCacheInvalidError.new("Secrets cache invalid (#{e})")
  end
  
  def name
    settings['connection']['id']
  end
  
  def uuid
    settings['connection']['uuid']
  end
  
  def type
    settings['connection']['type']
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
    hash.delete 'ipv4'
    update(hash)
  end
  
  IPV4_METHOD_AUTO = 'auto'
  IPV4_METHOD_MANUAL = 'manual'
  
  def ip4=(ip4)
    hash = settings
    hash['ipv4'] = ip4
    update(hash)
  end
  
  def ip4_auto!
    self.ip4 = {'method' => IPV4_METHOD_AUTO}
  end
  
  def ip4_manual=(addresses)
    # ensure wrapper array
    addresses = [addresses] unless addresses.is_a? Array
    
    self.ip4 = {
      'method' => IPV4_METHOD_MANUAL,
      'addresses' => ['aau', addresses.map{|a| a.to_nm_au}]
    }
  end
  
  def ip4
    if ipv4 = settings['ipv4']
      if ipv4['method'] == IPV4_METHOD_MANUAL
        address = ipv4['addresses'].first
        NetworkManager::Ip4Config.from_nm_au *address
      else
        IPV4_METHOD_AUTO
      end
    else
      nil
    end
  end
end
