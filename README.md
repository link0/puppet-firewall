# Firewall Puppet module
[![Build Status](https://travis-ci.org/link0/puppet-firewall.svg?branch=master)](https://travis-ci.org/link0/puppet-firewall)

Puppet module to manage firewalls on multiple operating systems

## Features

## Supported OS

* Ubuntu (iptables)
* Debian (iptables)
* FreeBSD (pf)

## Dependencies

## Example

```puppet
firewall::rule { '000 comment on input firewall rule':
    source    => '192.0.2.0/24',
    direction => 'INPUT',
    action    => 'accept',
}

firewall::rule { '500 comment on output firewall rule':
    destination => ['198.51.100.0/24', '203.0.113.0/24'],
    direction   => 'OUTPUT',
    action      => 'accept',
}

```


# Contributions

Pull requests are very welcome. Join [these fine folks](https://github.com/link0/puppet-firewall/graphs/contributors) who already helped to get this far with this module.

**To help guaranteeing the stability of the module, please make sure to add tests to your pull request.**
