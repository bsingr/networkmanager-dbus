require 'spec_helper'

describe "NetworkManager::DBus::Ip4Config" do
  before :each do
    @devices = fixture('devices.yml')
    @device = @devices[0]
    @config = @device['ip4_config'][0]
  end
  
  it 'shoud list properties' do
    config = NetworkManager::DBus::Ip4Config.new @device['properties']['Ip4Config']
    config.properties.should == @config['properties']
  end
end
