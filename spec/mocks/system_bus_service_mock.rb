class SystemBusServiceMock
  attr_reader :interface
  def initialize(interface)
    @interface = interface
  end
  def object(path)
    DBusMock.new path
  end
end
