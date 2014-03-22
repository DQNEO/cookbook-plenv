# Cookbook to install perl by plenv and perl-build

see http://shoheik.hatenablog.com/entry/2014/03/05/073232

This cookbook does below as root

require git

```
export PLENV_ROOT=/opt/plenv
mkdir -p /opt/plenv
git clone git://github.com/tokuhirom/plenv.git $PLENV_ROOT
git clone git://github.com/tokuhirom/Perl-Build.git  $PLENV_ROOT/plugins/perl-build/
$PLENV_ROOT/bin/plenv install 5.18.2
$PLENV_ROOT/bin/plenv rehash
$PLENV_ROOT/bin/plenv global  5.18.2 
$PLENV_ROOT/bin/plenv install-cpanm
$PLENV_ROOT/bin/plenv rehash
```

## TODO

* set environment variables in .*rc files (.bashrc , .zshrc etc)
