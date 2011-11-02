module SettingsMock
  def ListConnections
    object_paths = object_paths_from_fixture('settings_connections.yml')
    [ object_paths ]
  end
  def SaveHostname(hostn)
    []
  end
end

class DBusObjectMock
  include SettingsMock
  attr_accessor :default_iface, :introspect, :all_properties
  def initialize(path)
    @data = merged_dbus_fixtures[path]
  end
  def call(method, *args)
    if method == 'all_properties'
      all_properties
    else
      []
    end
  end
  def all_properties
    case default_iface
      when 'org.freedesktop.NetworkManager.Device.Wired'
        @data['ethernet']['properties']
      else
        @data['properties']
    end
  end
end

def dbus_interface_mock  
  system_bus_mock = ::SystemBusMock.new
  stub(DBusInterface).system_bus { system_bus_mock }
end