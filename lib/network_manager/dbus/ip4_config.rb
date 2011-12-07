class NetworkManager::DBus::Ip4Config
  include DBusInterface::Object
  map_dbus :default_iface => 'org.freedesktop.NetworkManager.IP4Config'
  
  def addresses
    self['Addresses'].map do |au|
      NetworkManager::Ip4Config.from_nm_au *au
    end
  end
  
  def nameservers
    self['Nameservers'].map do |address_u32|
      NetworkManager::Ip4Config.from_nm_au address_u32
    end
  end
end
