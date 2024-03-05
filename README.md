# Fine Tuning Language Models With Axon

```
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
```

`iex -S mix run`
`Example.test()`

The fine tuning, evaluation, Nx serving and embedding code from ElixirConf 2023

## Tune

The [tune](https://github.com/toranb/elixirconf2023/blob/main/lib/example/tune.ex) module for fine tuning with Roberta

```elixir
Example.tune()
```

## Evaluate

The [evaluate](https://github.com/toranb/elixirconf2023/blob/main/lib/example/evaluate.ex) module for evaluation

```elixir
Example.evaluate()
```

## Embeddings

The language model [embeddings](https://github.com/toranb/elixirconf2023/blob/main/lib/example.ex#L16-L25) can be generated from the token ids

```elixir
Example.get_token_ids() |> Example.embeddings()
```

## Nx Serving

The [cancellations](https://github.com/toranb/elixirconf2023/blob/main/lib/example/evaluate.ex#L32) can be generated for a given dataset with Nx Serving

```elixir
Example.cancellations()
```

To use the `cancellations` function above you must first fine tune the model to generate `cancel.axon` then you need to uncomment [this](https://github.com/toranb/elixirconf2023/blob/main/mix.exs#L17) in the mix.exs file and run `iex -S mix run`
