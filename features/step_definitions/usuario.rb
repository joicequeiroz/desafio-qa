Quando("Eu recebo o endpoint de usuarios {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para buscar o perfil do usuário") do
  $response = HTTParty.get("#{@uri}#{@api}", headers: @header)
  @body = $response.parsed_response["result"]["nome_usuario"]
  expect(@body).to eq("Joice")
end

Quando("Eu envio o verbo GET para buscar os créditos disponíveis") do
  $response = HTTParty.get("#{@uri}#{@api}/creditos", headers: @header)
end

Então("terei o retorno do status code {string} e a mensagem {string}") do |status, message|
  expect($response.code.to_s).to eq(status)
  puts "Response code: #{$response.code}"
  @body = $response.parsed_response["message"]
  expect(@body).to eq(message)
  puts @body
end
