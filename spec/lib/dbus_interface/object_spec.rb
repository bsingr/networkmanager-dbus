require 'spec_helper'

describe "DBusInterface::Object" do
  
  it 'should use default object_path' do
    class ADummyObject
      include ::DBusInterface::Object
      map_dbus :default_iface => 'foo.bar', :object_path => 'foo/bar'
    end
    ADummyObject.new.object_path.should == 'foo/bar'
  end
  
  it 'should use overwrite object_path' do
    class ADummyObject
      include ::DBusInterface::Object
      map_dbus :default_iface => 'foo.bar', :object_path => 'foo/bar'
    end
    ADummyObject.new('boo/laa').object_path.should == 'boo/laa'
  end
end
