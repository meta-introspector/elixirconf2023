defmodule Example do
  @moduledoc false

  def test(name) do
    repo = {:hf,name} 
    cache_dir = "/tmp/bumblebee_cache"	
    {:ok, model_info} = Bumblebee.load_model(repo,
    cache_dir: cache_dir,
    backend: EXLA.Backend)
    {:ok, tokenizer} = Bumblebee.load_tokenizer(repo)
    {:ok, generation_config} = Bumblebee.load_generation_config(repo,     cache_dir: cache_dir)
    
    generation_config =
      Bumblebee.configure(generation_config,
	max_new_tokens: 256,	architecture: :for_causal_language_modeling,
	strategy: %{type: :multinomial_sampling, top_p: 0.6}
      )

    serving =
      Bumblebee.Text.generation(model_info, tokenizer, generation_config,
	compile: [batch_size: 1, sequence_length: 1028],
	stream: true,
	defn_options: [compiler: EXLA]
      )
    
    # Should be supervised


    text = "Hello how are you?"
    Nx.Serving.run(serving, text)
    Nx.Serving.batched_run(serving,text) |> Enum.each(&IO.write/1)    
  end

end
