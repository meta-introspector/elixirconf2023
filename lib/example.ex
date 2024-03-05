defmodule Example do
  @moduledoc false

  def test() do
    repo = {:hf, "mistralai/Mistral-7B-Instruct-v0.2"}
    
    {:ok, model_info} = Bumblebee.load_model(repo, type: :bf16, backend: EXLA.Backend)
    {:ok, tokenizer} = Bumblebee.load_tokenizer(repo)
    {:ok, generation_config} = Bumblebee.load_generation_config(repo)
    
    generation_config =
      Bumblebee.configure(generation_config,
	max_new_tokens: 256,
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
#    Nx.Serving.batched_run(Mistral, prompt) |> Enum.each(&IO.write/1)    
  end

end
