Quando("Eu recebo o endpoint de empresas {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api
  @page = 1
  @row = 25

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para buscar todos as empresas") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  @body = $response.parsed_response["result"]["itens"][0]["cnpj"]
  expect(@body).to be_truthy
end

Quando("Eu envio o verbo GET para buscar uma empresa por CNPJ") do
  @get = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  @body = @get.parsed_response["result"]["itens"][0]["cnpj"]
  $response = HTTParty.get("#{@uri}#{@api}/#{@body}?page=#{@page}&rows=#{@row}", headers: @header)
  @valid = $response.parsed_response["result"]["dados"]["cnpj"]
  expect(@body).to eq(@valid)
end
