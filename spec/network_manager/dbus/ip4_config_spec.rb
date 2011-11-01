require 'spec_helper'

describe "NetworkManager::DBus::Ip4Config" do
  before :each do
    @data = fixture('ip4_configs.yml')
    @object_paths = object_paths_from_fixture('ip4_configs.yml')
  end

  it 'should map interface "org.freedesktop.NetworkManager.IP4Config"' do
    NetworkManager::DBus::Ip4Config.default_iface.should ==
      'org.freedesktop.NetworkManager.IP4Config'
  end
  
  it 'shoud list properties' do
    network_manager_dbus_mock
    con = NetworkManager::DBus::Ip4Config.new @object_paths.first
    con.properties.should == @data.first.last['properties']
  end
end
