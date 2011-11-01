require 'spec_helper'

describe "NetworkManager::DBus::SettingsConnection" do
  before :each do
    @data = fixture('settings_connections.yml')
    @object_paths = object_paths_from_fixture('settings_connections.yml')
  end
  
  it "should list properties" do
    network_manager_dbus_mock
    con = NetworkManager::DBus::SettingsConnection.new @object_paths.first
    con.properties.should == @data.first.last['properties']
  end
end
