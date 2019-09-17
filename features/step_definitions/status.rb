Quando("Eu recebo o endpoint de status {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para buscar o status da API") do
  $response = HTTParty.get("#{@uri}#{@api}", headers: @header)
  @body = $response.parsed_response["result"]
  @check_array = expect(@body).to match_array(
    { "ambiente" => "production",
      "ref" => "production",
      "versao" => "production" }
  )
end

Quando("Eu envio o verbo GET para buscar o status das fontes") do
  $response = HTTParty.get("#{@uri}#{@api}/fontes", headers: @header)
  @body = $response.parsed_response["result"][0]["fonte"]
  expect(@body).to eq("AntecedentesPB")
end

Quando("Eu envio o verbo GET para buscar o status das fontes por matriz") do
  $response = HTTParty.get("#{@uri}#{@api}/fontes/consultaPessoaDefault", headers: @header)
  @body = $response.parsed_response["result"][0]["fonte"]
  expect(@body).to eq("AntecedentesPoliciaFederal")
end
