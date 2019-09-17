Quando("Eu recebo o endpoint de matrizes {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para buscar todas matrizes") do
  $response = HTTParty.get("#{@uri}#{@api}", headers: @header)
  @body = $response.parsed_response["result"]["itens"]
  @check_array = expect(@body).to match_array(
    [{ "descricao" => nil,
       "nome" => "consultaEmpresaDefault",
       "titulo" => "Relatório padrão PJ",
       "creditos" => 1 },
     { "descricao" => nil,
       "nome" => "consultaPessoaDefault",
       "titulo" => "Relatório padrão PF",
       "creditos" => 1 }]
  )
end

Quando("Eu envio o verbo GET para detalhar uma matrizes") do
  $response_get = HTTParty.get("#{@uri}#{@api}", headers: @header)
  @matriz = $response_get.parsed_response["result"]["itens"][0]["nome"]
  $response = HTTParty.get("#{@uri}#{@api}/#{@matriz}", headers: @header)
  expect(@matriz).to eq(@matriz)
end
