module SettingsConnectionMock
  def GetSettings
    [ data['settings'] ]
  end
  
  def GetSecrets(name)
    # until we know what it correctly can return, here return sth broken
    raise DBus::Error.new 'm-settings-connection.c.830 - Internal error; secrets cache invalid.'
  end
  
  def Update(hash)
    data.merge(hash)
  end
end
