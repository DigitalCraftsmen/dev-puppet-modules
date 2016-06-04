# Class: dcl_dev_default
#
#
# Sample Usage :
#  See README
#
class dcl_dev_default () inherits dcl_dev_default::params
{


	class{'rsyslog::client':
	  log_local		 => true,
	  remote_servers => [
		{
		  host => '10.100.2.252',
		  port => '514',
		  protocol  => 'udp',
		},
	  ]
	}



}
