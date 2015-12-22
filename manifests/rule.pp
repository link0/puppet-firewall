
define firewall::rule (
  $source           = undef,
  $source_v6        = undef,
  $source_port      = undef,
  $destination      = undef,
  $destination_v6   = undef,
  $destination_port = undef,

  $interface_in     = undef,
  $interface_out    = undef,

  $protocol         = 'tcp',
  $state            = undef,
  $action           = 'accept',
  $description      = $name,

  $chain            = 'INPUT',

  $enable           = true,
  $enable_v6        = false,
) {

  include ::firewall

  # TODO:
  # Validate action
  # Validate state
  # Validate protocol

  if is_array($source) {
    $real_source = $source
  } else {
    $real_source = $source ? {
        undef   => [],
        default => [ $source ],
    }
  }

  if is_array($destination) {
    $real_destination = $destination
  } else {
    $real_destination = $destination ? {
        undef   => [],
        default => [ $destination ],
    }
  }

  case $firewall::firewall_type {
    'iptables': {

      iptables::rule { $name:
        source         => $source,
        source_v6      => $source_v6,
        destination    => $destination,
        destination_v6 => $destination_v6,
        in_interface   => $interface_in,
        out_interface  => $interface_out,
        port           => $destination_port,
        chain          => $chain,
        protocol       => $protocol,
        target         => upcase($action),
        enable         => $enable,
        enable_v6      => $enable_v6,
      }
    }
    'pf': {
      fail('PF is not yet implemented')
    }
    default: {
      fail('Unknown firewall::firewall_type')
    }
  }

}
