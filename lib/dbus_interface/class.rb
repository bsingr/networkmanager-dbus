module DBusInterface::Class
  def map_dbus(conf)
    @dbus ||= begin
      # ensure hash
      raise ArgumentError.new "map_dbus must receive a Hash instead of "\
                              "#{conf.class}" unless conf.is_a? Hash
      # ensure :default_iface is set
      raise ArgumentError.new "map_dbus must specify at least :default_iface"\
                              unless conf.has_key? :default_iface
      conf
    end
  end
  
  def no_properties!
    @no_properties = true
  end
  
  def no_properties?
    defined?(@no_properties) && @no_properties ? true : false
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
  
  def property(name, type = :string)
    underscored = underscore(name)
    define_method underscored do self[name] end
    if type == :boolean
      define_method "#{underscored}?" do self[name] ? true : false end
    end
  end
    
private

  def dbus
    @dbus
  end
  
  def underscore(camel_cased_word)
    camel_cased_word.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
   end
end
