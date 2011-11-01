def network_manager_root_mock
  devices_data = fixture('devices.yml')
  object_paths = object_paths_from_fixture('devices.yml')
  
  stub(NetworkManager::DBus::Root.instance).call do |method, *args|
    case method
      when 'GetDevices'
        [ object_paths ]
      when 'GetDeviceByIpIface'
        iface = args.first
        object_path, hash = devices_data.find do |object_path,hash|
          hash['properties']['Interface'] == iface
        end
        [ object_path ]
    end
  end
end
