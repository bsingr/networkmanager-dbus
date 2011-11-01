module DBusInterface
  class UnavailableError < StandardError; end
  
  class Configuration
    attr_accessor :interface
  end
  
  require 'dbus'
  require File.join(File.dirname(__FILE__), 'dbus_interface/class')
  require File.join(File.dirname(__FILE__), 'dbus_interface/object')
  
  def self.system_bus
    ::DBus::SystemBus.instance
  rescue Errno::ENOENT => e
    raise UnavailableError.new "DBus SystemBus not available!"
  end
  
  def self.service
    @@service ||= system_bus.service config.interface
  end
  
  def self.configure(&block)
    yield config
  end
  
  def self.config
    @@config ||= Configuration.new
  end
end
