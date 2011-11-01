require 'spec_helper'

describe "NetworkManager::DBus::Settings" do
  before :each do
    @settings = fixture('settings.yml')
  end
  
  it "should provide properties" do
    NetworkManager::DBus::Settings.instance.properties.should == @settings['properties']
  end
  
  it "should list connections" do
    NetworkManager::DBus::Settings.connections.size.should == 3
  end
  
  describe 'hostname' do
    after :each do
      NetworkManager::DBus::Settings.instance.hostname = @settings['properties']['Hostname']
    end
    
    it 'should get hostname' do
      NetworkManager::DBus::Settings.instance.hostname.should == @settings['properties']['Hostname']
    end
    
    it 'should set hostname' do
      NetworkManager::DBus::Settings.instance.hostname = 'a-host-name'
      NetworkManager::DBus::Settings.instance.hostname.should == 'a-host-name'
    end
  end
end
