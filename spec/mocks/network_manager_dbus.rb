def network_manager_dbus_mock
  DBusInterface::Connection.clear!
  dbus_interface_mock
  network_manager_root_mock
end