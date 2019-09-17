Dado("Eu recebo o endpoint de validar relatorios {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api
  @num_relt = Relatorio_Pessoa.numero.parsed_response["result"]["numero"]
  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo POST para aprovar manualmente um relatorio") do
  @body = {
    "aprovar": true,
    "mensagem": "Relatório aprovado com sucesso",
  }.to_json
  $response = HTTParty.post("#{@uri}#{@api}/validar/#{@num_relt}", body: @body, headers: @header)
  @body = $response.parsed_response["result"]["numero"]
  $response_get = HTTParty.get("#{@uri}#{@api}/#{@body}", headers: @header)
  @validate = $response_get.parsed_response["result"]["resultado"]
  expect(@validate).to eq("MANUAL_APPROVAL")
end

Quando("Eu envio o verbo POST para reprovar manualmente um relatorio") do
  @body = {
    "aprovar": false,
    "mensagem": "Relatório reprovado, não foi possível confirmar autenticidade",
  }.to_json
  $response = HTTParty.post("#{@uri}#{@api}/validar/#{@num_relt}", body: @body, headers: @header)
  @body = $response.parsed_response["result"]["numero"]
  $response_get = HTTParty.get("#{@uri}#{@api}/#{@body}", headers: @header)
  @validate = $response_get.parsed_response["result"]["resultado"]
  expect(@validate).to eq("MANUAL_REPROVAL")
end
