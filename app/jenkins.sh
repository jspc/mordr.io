# Build env
export PATH=/usr/local/bin:$PATH
export VERS=$(cat .ruby-version)

eval "$(rbenv init -)"

[ $(rbenv local $VERS) ] || rbenv install $VERS
rbenv global $VERS
echo -e "\n\n$(ruby -v)\n\n"

bundle
rake -T
rake clean

rbenv rehash

# Static analysis
excellent **/*
if [ "$(excellent **/* | grep warnings | awk '{print $2}')" -gt "30" ]; then
  exit 1;
fi

# Tests
rspec --order rand --format d
