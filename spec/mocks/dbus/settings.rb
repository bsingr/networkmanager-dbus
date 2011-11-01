def network_manager_settings_mock
  object_paths = object_paths_from_fixture('settings_connections.yml')
  
  stub(NetworkManager::DBus::Settings.instance.object).SaveHostname do |host|
    []
  end
  
  stub(NetworkManager::DBus::Settings.instance.object).ListConnections {
    [ object_paths ]
  }
end
