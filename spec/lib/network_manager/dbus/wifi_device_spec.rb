require 'spec_helper'

describe "NetworkManager::DBus::WifiDevice" do
  before :each do
    @data = fixture('devices.yml')
    @object_paths = object_paths_from_fixture('devices.yml')
  end
    
  it "should list poperties" do
    network_manager_dbus_mock
    dev = NetworkManager::DBus::WifiDevice.new @object_paths[2]
    dev.properties.should == @data["/org/freedesktop/NetworkManager/Device/2"]['wifi']['properties']
  end
  
  it 'should access #hw_address' do
    network_manager_dbus_mock
    dev = NetworkManager::DBus::WifiDevice.new @object_paths[2]
    dev.hw_address.should == '08:00:27:FB:3B:11'
  end
end
