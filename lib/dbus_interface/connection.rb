class DBusInterface::Connection
  attr_reader :default_iface, :object_path
  
  def initialize(default_iface, object_path)
    @default_iface = default_iface
    @object_path = object_path
  end
  
  def self.clear!
    connections.clear
  end
  
  def self.connections
    @@connections ||= {}
  end
  
  def self.add_connection(con)
    @@connections[con.key] = con
  end
  
  def self.instance_for(default_iface, object_path)
    con_key = connection_key(default_iface, object_path)
    if connections[con_key]
      connections[con_key]
    else
      new_con = new(default_iface, object_path)
      add_connection(new_con)
    end
  end
  
  def self.connection_key(default_iface, object_path)
    [default_iface,object_path].join
  end
  
  def key
    self.class.connection_key(default_iface, object_path)
  end
  
  def self.call(default_iface, object_path, method, *args)
    con = instance_for(default_iface, object_path)
    con.call(method, *args)
  end
  
  def call(method, *args)
    dbus.send(method, *args)
  end

private
  
  def dbus
    @dbus ||= begin
      d = DBusInterface.service.object(object_path)
      d.default_iface = default_iface
      d.introspect
      d
    end
  end
end
