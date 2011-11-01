require 'spec_helper'

describe "NetworkManager::DBus::Dhcp4Config" do
  before :each do
    @devices = fixture('devices.yml')
    @device = @devices[0]
    @config = @device['dhcp4_config']
  end
  
  it 'shoud list properties' do
    config = NetworkManager::DBus::Dhcp4Config.new @device['properties']['Dhcp4Config']
    config.properties.should == @config['properties']
  end
end
