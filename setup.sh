cd /mnt/data1/nix/time/2024/03/04/asdf/
. /mnt/data1/nix/time/2024/03/04/asdf/asdf.sh
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install 
asdf install erlang 26.0.2
asdf global erlang 26.0.2
asdf global elixir 1.15.4-otp-26
mix install
mix deps.get
mix 
