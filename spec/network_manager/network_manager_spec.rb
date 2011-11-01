require 'spec_helper'

describe "NetworkManager" do
  it 'should expose all devices' do
    network_manager_dbus_mock
    NetworkManager.devices.size.should == NetworkManager::DBus::Root.devices.size
    NetworkManager.devices.first.class.should == NetworkManager::DBus::Device
  end
  
  it 'should expose settings' do
    network_manager_dbus_mock
    NetworkManager.settings.should == NetworkManager::DBus::Settings.instance
  end
end
