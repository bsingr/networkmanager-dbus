module DBusInterface::Object
  def self.included(some_base)
    some_base.extend(DBusInterface::Class)
  end
  
  def call(method, *args)
    DBusInterface::Connection.call(self.class.default_iface, object_path, method, *args)
  end
  
  def properties
    call('all_properties')
  end
  
  def initialize(object_path = nil)
    self.object_path = object_path if object_path
  end
  
  def object_path=(p)
    @object_path = p
  end
  
  def object_path
    @object_path || self.class.object_path
  end
  
  # shortcut to access properties
  def [](key)
    properties[key]
  end
  
  def to_s
    "#{self.class} #{properties}"
  end

end
