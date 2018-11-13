# PAM module for Puppet

This module is only for legacy code. Please do not use it on new codes. 

## Description
Puppet module for managing /etc/security/access.conf
and /etc/security/limits.conf

### Example usage for managing access.conf

``` puppet
pam::access {
  "root":
    permission  => "+",
    entity      => "root",
    origin      => "ALL",
    priority    => "10";
  "ALL":
    permission  => "-",
    entity      => "ALL",
    origin      => "ALL",
    priority    => "20";
}
```

### Example usage for managing limits.conf

``` puppet
pam::limits {
  "nofile_hard":
     ensure   => present,
     domain   => "*",
     type     => "hard",
     item     => "nofile",
     value    => "8192",
     priority => 10;
  "nofile_soft":
     ensure   => present,
     domain   => "*",
     type     => "soft",
     item     => "nofile",
     value    => "1024",
     priority => 20;
}
```
