Puppet::Type.newtype(:git) do
	ensurable
	newparam(:name) do
		isnamevar
	end
	
	newparam(:url) do
	end
	
	newparam(:path) do
		defaultto('/root')
	end
	
	newparam(:branch) do
		defaultto('master')
	end
	
	newparam(:env) do
		defaultto('install')
	end
	
end
