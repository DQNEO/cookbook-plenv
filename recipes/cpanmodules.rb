node['default']['cpanmodules'].each do |name|
    bash "install cpan module #{name}" do
      code <<-EOC
        #{node['plenv_root']}/shims/cpanm #{name}
        #{node['plenv_root']}/bin/plenv rehash
   EOC
      action :run
    end
end
