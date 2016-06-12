# Class: dcl_dev_default
#
#
# Sample Usage :
#  See README
#
class dcl_dev_default () inherits dcl_dev_default::params
{


##
##  Define a default syslog configuration
##

	class{'rsyslog::client':
	  log_local		 => true,
	  remote_servers => [
		{
		  host => '10.100.2.252',
		  port => '2514',
		  protocol  => 'udp',
		},
	  ]
	}

	
##
## Ensure all hosts are remotely controlled by Foreman GUI
## Add Foreman Key for Remote Execution
##	

	package { 'curl': ensure => 'installed' }

	exec { "/usr/bin/curl -k https://puppet:8443/ssh/pubkey >> /root/.ssh/authorized_keys":
				   unless => "/bin/grep -c foreman-proxy /root/.ssh/authorized_keys"
	}
	
	

}
