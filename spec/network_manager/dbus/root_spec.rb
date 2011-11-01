require 'spec_helper'

describe "NetworkManager::DBus::Root" do
  before :each do
    @devices = fixture('devices.yml')
  end
  
  it "should list devices" do
    list = NetworkManager::DBus::Root.devices
    list.size.should > 0
    list.first.class.should == NetworkManager::DBus::Device
  end
  
  it "should return device_by_interface" do
    dev = NetworkManager::DBus::Root.device_by_interface 'eth0'
    dev.properties.should == @devices[0]['properties']
  end
  
  it 'should tell about internet_connection?' do
    NetworkManager::DBus::Root.internet_connection?.should be_true
  end
end
