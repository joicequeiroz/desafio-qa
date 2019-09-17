Quando("Eu recebo o endpoint de pessoas {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api
  @page = 1
  @row = 25

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para buscar todos as pessoas") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  @body = $response.parsed_response["result"]["itens"][0]["cpf"]
  expect(@body).to be_truthy
end

Quando("Eu envio o verbo GET para buscar CPF") do
  @get_cpf = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  @cpf = @get_cpf.parsed_response["result"]["itens"][0]["cpf"]
  $response = HTTParty.get("#{@uri}#{@api}/#{@cpf}?page=#{@page}&rows=#{@row}", headers: @header)
  @valid = $response.parsed_response["result"]["dados"]["cpf"]
  expect(@cpf).to eq(@valid)
end
