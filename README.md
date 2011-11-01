# NetworkManager-Ruby

This library provides a Ruby API to NetworkManager using its DBus Interface.

## Installation

Please make sure that you have `dbus` and `networkmanager` installed on the machine
were you want to use this library. Remote DBus wasn't tested.

    gem install networkmanager

## Examples

At the moment this is incomplete. So for now,
please have a look at the `examples` folder and the `specs`.

    require 'networkmanager'
    NetworkManager.devices.first['Interface'] # => 'eth0' or something similar
    NetworkManager.settings.hostname          # => 'your.host.name'

## Development

Development currently happens from my OSX machine where no dbus/networkmanager
is running. Therefore, i hacked some scripts together to be able to run rspec
over the wire

On the remote-machine (linux, dbus, networkmanager)

    `script/spec_server`
    
On the local-machine (osx)

    `guard`

# License

Please see file `MIT-LICENSE`. Copyright 2011 Jens Bissinger.
