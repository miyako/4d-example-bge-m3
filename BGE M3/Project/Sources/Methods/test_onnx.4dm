//%attributes = {}
var $en; $fr : 4D:C1709.Vector
var $AIClient : cs:C1710.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs:C1710.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8081/v1"  // onnx-genai

$batch:=$AIClient.embeddings.create(["query: Comment réinitialiser mon mot de passe?"; "passage: To reset your password you must contanct customer support."])

$fr:=$batch.embeddings[0].embedding
$en:=$batch.embeddings[1].embedding

$cosineSimilarity:=$en.cosineSimilarity($fr)
//0.70416629505377

ALERT:C41([$cosineSimilarity].join())