class SystemBusMock
  def service(interface)
    SystemBusServiceMock.new interface
  end
end
