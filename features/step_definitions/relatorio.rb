Dado("Eu recebo o endpoint de relatorios {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api
  @num_relt = Relatorio_Pessoa.numero.parsed_response["result"]["numero"]
  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para listar todos os relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}?page=1&rows=25", headers: @header)
end

Quando("Eu envio o verbo GET para listar os batches solicitados") do
  $response = HTTParty.get("#{@uri}#{@api}/batch?page=1&rows=25", headers: @header)
end

Quando("Eu envio o verbo GET para listar todos os relatorios pendentes") do
  $response = HTTParty.get("#{@uri}#{@api}/pendentes", headers: @header)
  @status = $response.parsed_response["result"]["itens"][0]["status"]
  expect(@status).not_to eql("CONCLUIDO")
end

Quando("Eu envio o verbo GET para detalhar um relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}", headers: @header)
  @relt = $response.parsed_response["result"]["numero"]
  expect((@relt)).to eq(@num_relt)
end

Quando("Eu envio o verbo GET para listar os batch especificos") do
  $response = HTTParty.get("#{@uri}#{@api}/batch/#{@num_relt}?page=1&rows=25", headers: @header)
end

Quando("Eu envio o verbo GET para validar os parametros de um relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}/parametros", headers: @header)
  @relt = $response.parsed_response["result"]["numero"]
  expect((@relt)).to eq(@num_relt)
end

Quando("Eu envio o verbo GET para validar as consultas de um relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}/consultas", headers: @header)
  @matriz = $response.parsed_response["result"]["nome_matriz"]
  expect((@matriz)).to eq("consultaPessoaDefault")
end

Quando("Eu envio o verbo GET para validar as validações de um relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}/validacoes", headers: @header)
  @relt = $response.parsed_response["result"]["numero"]
  expect((@relt)).to eq(@num_relt)
end

Quando("Eu envio o verbo GET para validar os dados de um relatorio") do
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}/dados", headers: @header)
  @relt = $response.parsed_response["result"]["numero"]
  expect((@relt)).to eq(@num_relt)
end

Então("a paginacao esta limitada a {int} registros por pagina") do |_pag|
  expect($response.parsed_response["result"]["paginacao"]["linhas"]).to eq(25)
end

Então("terei o retorno do status code {string}") do |status|
  expect($response.code.to_s).to eq(status)
  puts "Response code: #{$response.code}"
end
