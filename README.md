THIS IS ALPHA STUFF :)

see [TODOs](TODO.md)

# NetworkManager-Ruby

This library provides a Ruby API to NetworkManager using its DBus Interface.

Written using the [NetworkManager DBus API Specs v0.9](http://projects.gnome.org
/NetworkManager/developers/api/09/spec.html)

## Installation

Please make sure that you have `dbus` and `networkmanager` installed on the machine
were you want to use this library. Remote DBus wasn't tested.

    gem install networkmanager-dbus

## Examples

At the moment this is incomplete. So for now,
please have a look at the `examples` folder and the `specs`.

    require 'networkmanager-dbus'
    NetworkManager.devices.first['Interface'] # => 'eth0' or something similar
    NetworkManager.settings.hostname          # => 'your.host.name'

## Development

Development currently happens from my OSX machine where no dbus/networkmanager
is running. Therefore, i hacked some scripts together to be able to run rspec
over the wire.

On the remote-machine (linux, dbus, networkmanager)

    `script/spec_server`
    
On the local-machine (osx)

    `guard`

# License

Copyright 2011 Jens Bissinger. All rights reserved. [MIT-LICENSE](MIT-LICENSE)
