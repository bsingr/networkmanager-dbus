module SettingsMock
  def ListConnections
    object_paths = object_paths_from_fixture('settings_connections.yml')
    [ object_paths ]
  end
  def SaveHostname(hostn)
    []
  end
end
