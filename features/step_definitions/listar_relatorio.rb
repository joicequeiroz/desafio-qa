Dado("Eu recebo o endpoint de listar relatorios {string}") do |api|
  @uri = URL.query_service("api")
  @token = CONFIG["token"]
  @api = api
  @page = 1
  @row = 25
  @num_relt_pf = Relatorio_Pessoa.numero.parsed_response["result"]["numero"]
  @num_relt_pj = Relatorio_Empresa.numero.parsed_response["result"]["numero"]
  @header = { 'Content-Type': "application/json;application/x-www-form-urlencoded",
             'Authorization': "#{@token}" }
end

Quando("Eu envio o verbo GET para listar relatorios por CPF") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&numero_documento=05255784044", headers: @header)
  @pessoa = $response.parsed_response["result"]["itens"][0]["tipo_pessoa"]
  @cpf = $response.parsed_response["result"]["itens"][0]["numero_documento"]
  expect(@cpf).to be_truthy
end

Quando("Eu envio o verbo GET para listar relatorios por CNPJ") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&numero_documento=24727373000208", headers: @header)
  @pj = $response.parsed_response["result"]["itens"][0]["tipo_pessoa"]
  @cnpj = $response.parsed_response["result"]["itens"][0]["numero_documento"]
  expect(@cnpj).to be_truthy
end

Quando("Eu envio o verbo GET para listar relatorios por Tipo Pessoa") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&tipo_pessoa=Pessoa", headers: @header)
  @pessoa = $response.parsed_response["result"]["itens"][0]["tipo_pessoa"]
  expect(@pessoa).not_to eql("Empresa")
end

Quando("Eu envio o verbo GET para listar relatorios por Tipo Empresa") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&tipo_pessoa=Empresa", headers: @header)
  @empresa = $response.parsed_response["result"]["itens"][0]["tipo_pessoa"]
  expect(@empresa).not_to eql("Pessoa")
end

Quando("Eu envio o verbo GET para listar relatorios por Nome Matriz Pessoa") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&nome=consultaPessoaDefault", headers: @header)
  @matriz_pf = $response.parsed_response["result"]["itens"][0]["nome"]
  expect(@matriz_pf).to eql("consultaPessoaDefault")
end

Quando("Eu envio o verbo GET para listar relatorios por Nome Matriz Empresa") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&nome=consultaEmpresaDefault", headers: @header)
  @matriz_pj = $response.parsed_response["result"]["itens"][0]["nome"]
  expect(@matriz_pj).to eql("consultaEmpresaDefault")
end

Quando("Eu envio o verbo GET para listar relatorios por Resultado VALID") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&resultado=VALID", headers: @header)
  @valid = $response.parsed_response["result"]["itens"][0]["resultado"]
  expect(@valid).not_to eql("INVALID")
end

Quando("Eu envio o verbo GET para listar relatorios por Resultado INVALID") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&resultado=VALID", headers: @header)
  @valid = $response.parsed_response["result"]["itens"][0]["resultado"]
  expect(@valid).not_to eql("VALID")
end

Quando("Eu envio o verbo GET para listar relatorios por Status") do
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&status=CONCLUIDO", headers: @header)
  @status = $response.parsed_response["result"]["itens"][0]["status"]
  expect(@status).to eql("CONCLUIDO")
end

Quando("Eu envio o verbo GET para listar relatorios por ordenacao crescente") do
  $response_1 = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  #Antes de aplicar a ordem crescente
  @hash1 = $response_1.parsed_response["result"]["itens"][0]["numero"]
  @hash2 = $response_1.parsed_response["result"]["itens"][1]["numero"]
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&sort=tipo_pessoa=Pessoa", headers: @header)
  #Depois de aplicar a ordem crescente
  @hash3 = $response.parsed_response["result"]["itens"][0]["numero"]
  @hash4 = $response.parsed_response["result"]["itens"][1]["numero"]
  expect(@hash1).not_to eql(@hash3)
end

Quando("Eu envio o verbo GET para listar relatorios por ordenacao decrescente") do
  $response_1 = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}", headers: @header)
  #Antes de aplicar a ordem decrescente
  @hash1 = $response_1.parsed_response["result"]["itens"][0]["numero"]
  @hash2 = $response_1.parsed_response["result"]["itens"][1]["numero"]
  $response = HTTParty.get("#{@uri}#{@api}?page=#{@page}&rows=#{@row}&sort=-tipo_pessoa=Pessoa", headers: @header)
  #Depois de aplicar a ordem crescente
  @hash3 = $response.parsed_response["result"]["itens"][0]["numero"]
  @hash4 = $response.parsed_response["result"]["itens"][1]["numero"]
  expect(@hash2).not_to eql(@hash4)
end
