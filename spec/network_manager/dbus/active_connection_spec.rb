require 'spec_helper'

describe "NetworkManager::DBus::ActiveConnection" do
  before :each do
    @devices = fixture('devices.yml')
    @device = @devices[0]
    @config = @device['active_connection']
  end
  
  it 'should map interface "org.freedesktop.NetworkManager.Connection.Active"' do
    NetworkManager::DBus::ActiveConnection.default_iface.should ==
      'org.freedesktop.NetworkManager.Connection.Active'
  end
  
  it 'shoud list properties' do
    config = NetworkManager::DBus::ActiveConnection.new @device['properties']['ActiveConnection']
    config.properties.should == @config['properties']
  end
end
