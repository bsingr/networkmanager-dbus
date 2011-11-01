require 'spec_helper'

describe "NetworkManager::DBus::Device" do
  before :each do
    @devices = fixture('devices.yml')
    @list = NetworkManager::DBus::Root.devices
  end
  
  it "should list poperties" do
    # simple test
    @list.first.properties['Interface'].should ==
      @devices[0]['properties']['Interface']
      
    # total comparison
    @list.first.properties.should ==
      @devices[0]['properties']
  end
  
  describe "NM_DEVICE_TYPE" do
    it "should detect ethernet devices" do
      @list.first.ethernet?.should == true
      @list.first.ethernet.class.should ==
        NetworkManager::DBus::EthernetDevice
    end
  end
  
  it 'should provide ip4_config' do
    @list.first.ip4_config.class.should ==
      NetworkManager::DBus::Ip4Config
  end
  
  it 'should provide active_connection' do
    @list.first.active_connection.class.should ==
      NetworkManager::DBus::ActiveConnection
  end
end
