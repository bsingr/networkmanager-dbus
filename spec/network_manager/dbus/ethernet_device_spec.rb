require 'spec_helper'

describe "NetworkManager::DBus::EthernetDevice" do
  before :each do
    @devices = fixture('devices.yml')
    @device = @devices[0]
    @ethernet_device = @device['ethernet']
  end
    
  it "should list poperties" do
    object_path = NetworkManager::DBus::Root.devices.first.object_path
    ethernet_device = NetworkManager::DBus::EthernetDevice.new object_path
    
    # simple test
    ethernet_device.properties['HwAddress'].should ==
      @ethernet_device['properties']['HwAddress']
      
    # total comparison
    ethernet_device.properties.should == @ethernet_device['properties']
  end
end
