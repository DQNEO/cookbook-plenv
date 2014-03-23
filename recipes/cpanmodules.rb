%w{
Image::ExifTool
YAML::Tiny
JSON
Amazon::S3
Amazon::SQS::Simple
LWP::Protocol::https
Parallel::ForkManager
Email::Sender
Data::Recursive::Encode
File::Touch
Time::HiRes
}.each do |name|
    bash "install cpan modules" do
      code <<-EOC
        #{node['plenv_root']}/shims/cpanm #{name}
        #{node['plenv_root']}/bin/plenv rehash
   EOC
      action :run
    end
end
