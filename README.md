# AVR-VM

This is a 64 bit Ubuntu 16.04 virtual machine managed by Vagrant, that contains tools particulary useful for RE and exploit development with AVR as the target architecture. Furthermore, the config explains how to pass hardware devices into the VM, so that you can do work on real hardware.

It exposes itself as 10.10.10.10 on a private network.

The directory "~/shared" is shared with the host.

## Included tools
- AVR gcc toolchain
- gdb 8.0 compiled for AVR with python support
- radare2
- simavr
- avrdude
- avarice
- picocom
- tmux
- zsh + oh-my-zsh

## Dependencies
- Virtualbox
    - Alternatively the Vagrantfile can be modified to run on something like libvirt, but this is untested
- Vagrant

## Usage
- `cd AVR-VM`
- `vagrant up` (start)
- `vagrant ssh` (drop into shell)
- `vagrant halt hardware` (stop)
