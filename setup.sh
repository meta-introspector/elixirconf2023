apt-get -y install  build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

. /mnt/data1/nix/time/2024/03/04/asdf/asdf.sh
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.15.4-otp-26
asdf install erlang 26.0.2
asdf global erlang 26.0.2
asdf global elixir 1.15.4-otp-26
mix install
mix deps.get
mix 

iex -S mix run

