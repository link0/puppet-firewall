
class firewall (

  $ensure        = $firewall::params::ensure,
  $service_name  = $firewall::params::service_name,
  $package_name  = $firewall::params::package_name,

  $firewall_type = $firewall::params::firewall_type,

) inherits firewall::params {

}
