# TODO:
#  - RedHat
#  - Gentoo
#  - ArchLinux
#  - ... etcetera

class firewall::params {
  case $::osfamily {
    'Debian': {
      $firewall_type = 'iptables'
      case $::operatingsystem {
        'Debian': {
          if versioncmp($::operatingsystemrelease, '8.0') >= 0 {
            $service_name = 'netfilter-persistent'
            $package_name = 'iptables-persistent'
          } else {
            $service_name = 'iptables-persistent'
            $package_name = 'iptables-persistent'
          }

        }
        'Ubuntu': {
          $package_name = 'iptables-persistent'
          if versioncmp($::operatingsystemrelease, '14.10') >= 0 {
            $service_name = 'netfilter-persistent'
          } else {
            $service_name = 'iptables-persistent'
          }

        }
        default: {
          $service_name = 'iptables-persistent'
          $package_name = 'iptables-persistent'
        }
      }
    }
    'FreeBSD': {
      $firewall_type = 'pf'
      fail("FreeBSD is not yet implemented")
    }
    default: {
      fail("Firewall module is not implemented for OSFamily ${::osfamily}")
    }
  }
}
