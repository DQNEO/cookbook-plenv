directory "#{node['plenv_root']}" do
  mode 0755
  recursive true
end

git "#{node['plenv_root']}" do
  repository "git://github.com/tokuhirom/plenv.git"
  reference "master"
end

directory "#{node['plenv_root']}/plugins/perl-build" do
  mode 0755
  recursive true
end

git "#{node['plenv_root']}/plugins/perl-build" do
  repository "git://github.com/tokuhirom/Perl-Build.git"
  reference "master"
end

bash "plenv setup and setup perl" do
  environment 'PLENV_ROOT' => "#{node['plenv_root']}"
  code <<-EOC
        #{node['plenv_root']}/bin/plenv install #{node['perl_version']}
        #{node['plenv_root']}/bin/plenv rehash
        #{node['plenv_root']}/bin/plenv global  #{node['perl_version']}
        #{node['plenv_root']}/bin/plenv install-cpanm
        #{node['plenv_root']}/bin/plenv rehash
   EOC
  
  creates "#{node['plenv_root']}/shims/perl#{node['perl_version']}"
  action :run
end

bash "install cpan modules" do
  environment 'PLENV_ROOT' => "#{node['plenv_root']}"
  code <<-EOC
        #{node['plenv_root']}/shims/cpanm Acme::Nyaa
   EOC
  action :run
  creates "/opt/plenv/versions/#{node['perl_version']}/lib/perl5/site_perl/#{node['perl_version']}/Acme/Nyaa.pm"
end

=begin

execute "setup-bashrc" do
  user USER_NAME
  command <<-EOH
        echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> #{node['plenv_root']}/.bashrc
        echo 'eval "$(plenv init -)"' >> #{node['plenv_root']}/.bashrc
  EOH
  not_if "grep plenv #{node['plenv_root']}/.bashrc"
  action :run
end
=end

