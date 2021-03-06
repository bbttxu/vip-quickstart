# Postfix
package { 'postfix': ensure => present }
service { 'postfix': ensure => running }
exec { 'configure postfix hostname':
    command => 'sed -i "s/precise32/vip.dev/g" /etc/postfix/main.cf',
    onlyif => 'cat /etc/postfix/main.cf | grep "precise32"',
    user => root,
    notify => Service['postfix']
}

# ClamAV
# package { 'clamav': ensure => present }

# exec { 'update clamav db':
#   command => 'sudo freshclam',
#   require => Package['clamav']
# }
