module DBusInterface::Class
  def map_dbus(conf)
    @dbus ||= begin
      # ensure hash
      raise ArgumentError.new "adapt_dbus must receive a hash instead of"\
                              "#{conf.class}" unless conf.is_a? Hash
      # ensure :default_iface is set
      raise ArgumentError.new "adapt_dbus must specify at least :default_iface"\
                              unless conf.has_key? :default_iface
      conf
    end
  end

  def default_iface
    dbus[:default_iface]
  end
  
  def object_path
    dbus[:object_path]
  end
  
  # singletons must be given an :object_path
  def instance
    @instance ||= new
  end

private

  def dbus
    @dbus
  end
end