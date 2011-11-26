module DBusInterface::Object
  def self.included(some_base)
    some_base.extend(DBusInterface::Class)
  end
  
  def call(method, *args)
    if object_path == nil || object_path == '/'
      nil
    else
      DBusInterface::Connection.call(self.class.default_iface, object_path, method, *args)
    end
  end
  
  def properties
    if self.class.no_properties?
      nil
    else
      call('all_properties')
    end
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
