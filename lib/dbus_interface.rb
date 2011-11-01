module DBusInterface
  require 'dbus'
  require File.join(File.dirname(__FILE__), 'dbus_interface/class')
  require File.join(File.dirname(__FILE__), 'dbus_interface/object')
  
  def self.system_bus
    ::DBus::SystemBus.instance
  end
  
  def self.service
    @@service
  end
  
  def self.service=(s)
    @@service = system_bus.service s
  end
  
  def self.configure(&block)
    yield self
  end
end
