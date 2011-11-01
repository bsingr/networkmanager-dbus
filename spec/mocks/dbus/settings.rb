def network_manager_settings_mock
  object_paths = object_paths_from_fixture('settings_connections.yml')
  
  stub(NetworkManager::DBus::Settings.instance).call do |method,*args|
    case method
      when 'SaveHostname'
        hostname = args.first
        []
      when 'ListConnections'
        [ object_paths ]
    end
  end
end
