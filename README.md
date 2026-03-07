## [BAAI/bge-m3](https://huggingface.co/BAAI/bge-m3)

BGE M3 is a text embedding model released by **Beijing Academy of Artificial Intelligence** in 2024. It supports more than `100` languages. 

|`max_position_embeddings`|`hidden_size`|`num_hidden_layers`|`pooling`
|-:|-:|-:|-:|
|`8192`|`1024`|`24`|`cls`

> [!TIP]
> `llama.cpp` seems to work better with `mean` pooling.

```4d
var $en; $fr : 4D.Vector
var $AIClient : cs.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  

$en:=$AIClient.embeddings.create("How do I reset my password?").embedding.embedding
$fr:=$AIClient.embeddings.create("Comment réinitialiser mon mot de passe?").embedding.embedding

$cosineSimilarity:=$en.cosineSimilarity($fr)

ALERT([$cosineSimilarity].join())
```

##### Cosine similarity from example code above:

|llama.cpp `Q8_0`|ONNX Runtime `Int8`
|-|-|
|`0.84130115104232`|`0.70416629505377`|
