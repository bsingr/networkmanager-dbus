require 'spec_helper'

describe "NetworkManager::DBus::SettingsConnection" do
  before :each do
    @settings = fixture('settings.yml')
    @connection = @settings['connections'][0]
  end
  
  it "should get settings" do
    NetworkManager::DBus::Settings.connections.first.object.GetSettings.first['connection']['id'].should ==
      @connection['settings']['connection']['id']
  end
end
