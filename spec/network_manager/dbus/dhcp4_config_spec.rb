require 'spec_helper'

describe "NetworkManager::DBus::Dhcp4Config" do
  before :each do
    @data = fixture('dhcp4_configs.yml')
    @object_paths = object_paths_from_fixture('dhcp4_configs.yml')
  end

  it 'should map interface "org.freedesktop.NetworkManager.DHCP4Config"' do
    NetworkManager::DBus::Dhcp4Config.default_iface.should ==
      'org.freedesktop.NetworkManager.DHCP4Config'
  end
  
  it 'shoud list properties' do
    network_manager_dbus_mock
    con = NetworkManager::DBus::Dhcp4Config.new @object_paths.first
    con.properties.should == @data.first.last['properties']
  end
end
