node default{
	git{"keystone":
		url	=> "git://github.com/openstack/keystone.git",
		path 	=> "/root",
		env	=> "develop",
		branch	=> "stable/essex",
		ensure	=> present,
	}
}
