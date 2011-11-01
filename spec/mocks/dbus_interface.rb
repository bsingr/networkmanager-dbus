class DBusObjectMock
  attr_accessor :default_iface, :introspect, :all_properties
  def initialize(path)
    @data = merged_dbus_fixtures[path]
  end
  def call(method, *args)
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