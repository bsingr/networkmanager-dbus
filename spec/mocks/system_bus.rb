class SystemBusMock
  def service(interface)
    SystemBusServiceMock.new interface
  end
end

class SystemBusServiceMock
  attr_reader :interface
  def initialize(interface)
    @interface = interface
  end
  def object(path)
    DBusObjectMock.new path
  end
end
