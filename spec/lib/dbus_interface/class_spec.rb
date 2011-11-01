require 'spec_helper'

describe "DBusInterface::Class" do
  
  it 'should map_dbus :default_iface' do
    module AWorkingDummyInterface
      extend ::DBusInterface::Class
      map_dbus :default_iface => 'foo.bar', :object_path => 'foo/bar'
    end
    AWorkingDummyInterface.default_iface.should == 'foo.bar'
    AWorkingDummyInterface.object_path.should == 'foo/bar'
  end
  
  it 'should raise if map_dbus lacks :default_iface' do
    lambda do
      module ABrokenDummyInterface
        extend ::DBusInterface::Class
        map_dbus :foo => 'bar'
      end
    end.should raise_error(ArgumentError, 'map_dbus must specify at least :default_iface')
  end
  
  it 'should raise if map_dbus lacks :default_iface' do
    lambda do
      module ABrokenDummyInterface
        extend ::DBusInterface::Class
        map_dbus 123
      end
    end.should raise_error(ArgumentError, 'map_dbus must receive a Hash instead of Fixnum')
  end
end
