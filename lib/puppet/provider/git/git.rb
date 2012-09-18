require 'fileutils'
Puppet::Type.type(:git).provide(:git) do
commands :git => "git"
    def create
	if File.directory?(resource[:path]+"/"+resource[:name]) then
		#switch branch
		system("cd #{resource[:path]}/#{resource[:name]} && git checkout #{resource[:branch]}")
	else
		#git clone and switch branch
		git "clone", resource[:url],"-l", resource[:path]+"/"+resource[:name],"-b",resource[:branch]
		#pip requires
		system("/usr/bin/pip install -r #{resource[:path]}/#{resource[:name]}/tools/pip-requires")
		#install
		system("cd #{resource[:path]}/#{resource[:name]} && python setup.py #{resource[:env]}")
	end
    end
    def exists?
	if resource[:ensure].to_s == "present" then
		false
	else
		true
	end 
    end

    def destroy
	system("pip uninstall #{resource[:name]} -y")
	system("rm -rf #{resource[:path]}/#{resource[:name]}")
    end

end
