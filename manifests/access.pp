define pam::access (
  $permission,
  $origin,
  $entity     = $title,
  $ensure     = present,
  $priority   = '10'
) {
  include pam

  if ! ($::osfamily in ['Debian', 'RedHat', 'Suse']) {
    fail("pam::access does not support osfamily ${::osfamily}")
  }

  if ! ($permission in ['+', '-']) {
    fail("Permission must be + or - ; recieved ${permission}")
  }

  realize Concat['/etc/security/access.conf']

  concat::fragment { "pam::access ${permission}${entity}${origin}":
    target  => '/etc/security/access.conf',
    content => "${permission}:${entity}:${origin}\n",
    order   => $priority,
  }

}
