module DBusInterface::Object
  def self.included(some_base)
    some_base.extend(DBusInterface::Class)
  end
  
  def call(method, *args)
    object.send(method, *args)
  end
  
  def properties
    object.all_properties
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

private

  def object
    @object ||= begin
      object = DBusInterface.service.object(object_path)
      object.default_iface = self.class.default_iface
      object.introspect
      object
    end
  end

end
