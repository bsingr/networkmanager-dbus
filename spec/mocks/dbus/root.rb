def network_manager_root_mock
  devices_data = fixture('devices.yml')
  object_paths = object_paths_from_fixture('devices.yml')
  
  stub(NetworkManager::DBus::Root.instance.object).GetDevices {
    [ object_paths ]
  }
  
  stub(NetworkManager::DBus::Root.instance.object).GetDeviceByIpIface { |iface|
    object_path, hash = devices_data.find{|object_path,hash| hash['properties']['Interface'] == iface}
    [ object_path ]
  }
end
