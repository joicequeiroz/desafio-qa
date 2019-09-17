Quando("Eu recebo diversos endpoints") do
  @uri = URL.query_service("api")
  @token_v = CONFIG["token"]
  @page = 1
  @row = 25

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token_v}" }
end

Quando("Eu envio o verbo GET para buscar um relatorio") do
  @token_i = CONFIG["inv_token"]

  @header = { 'Content-Type': "application/json",
             'Authorization': "#{@token_i}" }

  $response = HTTParty.get("#{@uri}/relatorios?page=#{@page}&rows=#{@row}", headers: @header)
end

Quando("Eu envio o verbo POST para criar um relatorio sem os dados obrigatórios") do
  $response = HTTParty.post("#{@uri}/relatorios", headers: @header)
end

Quando("Eu envio o verbo POST para criar um relatorio sem informar a Matriz") do
  @dta_nasc = Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%d/%m/%Y")
  @nome = Faker::Movies::HarryPotter.character
  @cpf = Faker::IDNumber.brazilian_citizen_number(formatted: false)

  @body = {
    "matriz": nil,
    "opcoes": {},
    "parametros": {
      "cnh_categoria": nil,
      "cnh_data_da_primeira_habilitacao": nil,
      "cnh_data_de_validade": nil,
      "cnh_estado_expedicao": nil,
      "cnh_imagem_completa": nil,
      "cnh_imagem_frente": nil,
      "cnh_imagem_verso": nil,
      "cnh_numero": nil,
      "cnh_numero_espelho": nil,
      "cnh_numero_renach": nil,
      "cnh_numero_seguranca": nil,
      "cnpj_inscricao_estadual": nil,
      "cnpj_nome": nil,
      "cnpj_numero": nil,
      "cpf_data_de_nascimento": @dta_nasc,
      "cpf_estado_civil": nil,
      "cpf_nome": @nome,
      "cpf_nome_da_mae": nil,
      "cpf_nome_do_pai": nil,
      "cpf_numero": @cpf,
      "cpf_sexo": nil,
      "crlv_imagem_completa": nil,
      "email": nil,
      "endereco_bairro": nil,
      "endereco_cep": nil,
      "endereco_cidade": nil,
      "endereco_complemento": nil,
      "endereco_estado": nil,
      "endereco_logradouro": nil,
      "endereco_numero": nil,
      "imagens_face_match": nil,
      "latitude": nil,
      "longitude": nil,
      "rg_data_de_expedicao": nil,
      "rg_digito": nil,
      "rg_estado_expedicao": nil,
      "rg_imagem_frente": nil,
      "rg_imagem_verso": nil,
      "rg_numero": nil,
      "rg_orgao_emissor": nil,
      "doc_imagem_completa": nil,
      "doc_imagem_frente": nil,
      "doc_imagem_verso": nil,
      "selfie": nil,
      "socios": nil,
      "telefone_codigo_pais": nil,
      "telefone_ddd": nil,
      "telefone_numero": nil,
      "titulo_eleitor": nil,
      "token_sdk": nil,
      "veiculo_placa": nil,
      "veiculo_renavam": nil,
      "rntrc": nil,
    },
  }.to_json

  $response = HTTParty.post("#{@uri}/relatorios", body: @body, headers: @header)
end

Quando("Eu envio o verbo POST para criar um relatorio sem informar a Data de Nascimento") do
  @nome = Faker::Movies::HarryPotter.character
  @cpf = Faker::IDNumber.brazilian_citizen_number(formatted: false)

  @body = {
    "matriz": "consultaPessoaDefault",
    "opcoes": {},
    "parametros": {
      "cnh_categoria": nil,
      "cnh_data_da_primeira_habilitacao": nil,
      "cnh_data_de_validade": nil,
      "cnh_estado_expedicao": nil,
      "cnh_imagem_completa": nil,
      "cnh_imagem_frente": nil,
      "cnh_imagem_verso": nil,
      "cnh_numero": nil,
      "cnh_numero_espelho": nil,
      "cnh_numero_renach": nil,
      "cnh_numero_seguranca": nil,
      "cnpj_inscricao_estadual": nil,
      "cnpj_nome": nil,
      "cnpj_numero": nil,
      "cpf_data_de_nascimento": nil,
      "cpf_estado_civil": nil,
      "cpf_nome": @nome,
      "cpf_nome_da_mae": nil,
      "cpf_nome_do_pai": nil,
      "cpf_numero": nil,
      "cpf_sexo": nil,
      "crlv_imagem_completa": nil,
      "email": nil,
      "endereco_bairro": nil,
      "endereco_cep": nil,
      "endereco_cidade": nil,
      "endereco_complemento": nil,
      "endereco_estado": nil,
      "endereco_logradouro": nil,
      "endereco_numero": nil,
      "imagens_face_match": nil,
      "latitude": nil,
      "longitude": nil,
      "rg_data_de_expedicao": nil,
      "rg_digito": nil,
      "rg_estado_expedicao": nil,
      "rg_imagem_frente": nil,
      "rg_imagem_verso": nil,
      "rg_numero": nil,
      "rg_orgao_emissor": nil,
      "doc_imagem_completa": nil,
      "doc_imagem_frente": nil,
      "doc_imagem_verso": nil,
      "selfie": nil,
      "socios": nil,
      "telefone_codigo_pais": nil,
      "telefone_ddd": nil,
      "telefone_numero": nil,
      "titulo_eleitor": nil,
      "token_sdk": nil,
      "veiculo_placa": nil,
      "veiculo_renavam": nil,
      "rntrc": nil,
    },
  }.to_json

  $response = HTTParty.post("#{@uri}/relatorios", body: @body, headers: @header)
end

Quando("Eu envio o verbo POST para criar um relatorio sem informar do CPF") do
  @dta_nasc = Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%d/%m/%Y")
  @nome = Faker::Movies::HarryPotter.character
  @cpf = Faker::IDNumber.brazilian_citizen_number(formatted: false)

  @body = {
    "matriz": "consultaPessoaDefault",
    "opcoes": {},
    "parametros": {
      "cnh_categoria": nil,
      "cnh_data_da_primeira_habilitacao": nil,
      "cnh_data_de_validade": nil,
      "cnh_estado_expedicao": nil,
      "cnh_imagem_completa": nil,
      "cnh_imagem_frente": nil,
      "cnh_imagem_verso": nil,
      "cnh_numero": nil,
      "cnh_numero_espelho": nil,
      "cnh_numero_renach": nil,
      "cnh_numero_seguranca": nil,
      "cnpj_inscricao_estadual": nil,
      "cnpj_nome": nil,
      "cnpj_numero": nil,
      "cpf_data_de_nascimento": @dta_nasc,
      "cpf_estado_civil": nil,
      "cpf_nome": @nome,
      "cpf_nome_da_mae": nil,
      "cpf_nome_do_pai": nil,
      "cpf_numero": nil,
      "cpf_sexo": nil,
      "crlv_imagem_completa": nil,
      "email": nil,
      "endereco_bairro": nil,
      "endereco_cep": nil,
      "endereco_cidade": nil,
      "endereco_complemento": nil,
      "endereco_estado": nil,
      "endereco_logradouro": nil,
      "endereco_numero": nil,
      "imagens_face_match": nil,
      "latitude": nil,
      "longitude": nil,
      "rg_data_de_expedicao": nil,
      "rg_digito": nil,
      "rg_estado_expedicao": nil,
      "rg_imagem_frente": nil,
      "rg_imagem_verso": nil,
      "rg_numero": nil,
      "rg_orgao_emissor": nil,
      "doc_imagem_completa": nil,
      "doc_imagem_frente": nil,
      "doc_imagem_verso": nil,
      "selfie": nil,
      "socios": nil,
      "telefone_codigo_pais": nil,
      "telefone_ddd": nil,
      "telefone_numero": nil,
      "titulo_eleitor": nil,
      "token_sdk": nil,
      "veiculo_placa": nil,
      "veiculo_renavam": nil,
      "rntrc": nil,
    },
  }.to_json

  $response = HTTParty.post("#{@uri}/relatorios", body: @body, headers: @header)
end

Quando("Eu envio o verbo POST para criar um relatorio sem informar do CNPJ") do
  @dta_nasc = Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%d/%m/%Y")
  @nome = Faker::Movies::HarryPotter.character
  @cpf = Faker::IDNumber.brazilian_citizen_number(formatted: false)

  @body = {
    "matriz": "consultaEmpresaDefault",
    "opcoes": {},
    "parametros": {
      "cnh_categoria": nil,
      "cnh_data_da_primeira_habilitacao": nil,
      "cnh_data_de_validade": nil,
      "cnh_estado_expedicao": nil,
      "cnh_imagem_completa": nil,
      "cnh_imagem_frente": nil,
      "cnh_imagem_verso": nil,
      "cnh_numero": nil,
      "cnh_numero_espelho": nil,
      "cnh_numero_renach": nil,
      "cnh_numero_seguranca": nil,
      "cnpj_inscricao_estadual": nil,
      "cnpj_nome": nil,
      "cnpj_numero": nil,
      "cpf_data_de_nascimento": @dta_nasc,
      "cpf_estado_civil": nil,
      "cpf_nome": @nome,
      "cpf_nome_da_mae": nil,
      "cpf_nome_do_pai": nil,
      "cpf_numero": @cpf,
      "cpf_sexo": nil,
      "crlv_imagem_completa": nil,
      "email": nil,
      "endereco_bairro": nil,
      "endereco_cep": nil,
      "endereco_cidade": nil,
      "endereco_complemento": nil,
      "endereco_estado": nil,
      "endereco_logradouro": nil,
      "endereco_numero": nil,
      "imagens_face_match": nil,
      "latitude": nil,
      "longitude": nil,
      "rg_data_de_expedicao": nil,
      "rg_digito": nil,
      "rg_estado_expedicao": nil,
      "rg_imagem_frente": nil,
      "rg_imagem_verso": nil,
      "rg_numero": nil,
      "rg_orgao_emissor": nil,
      "doc_imagem_completa": nil,
      "doc_imagem_frente": nil,
      "doc_imagem_verso": nil,
      "selfie": nil,
      "socios": nil,
      "telefone_codigo_pais": nil,
      "telefone_ddd": nil,
      "telefone_numero": nil,
      "titulo_eleitor": nil,
      "token_sdk": nil,
      "veiculo_placa": nil,
      "veiculo_renavam": nil,
      "rntrc": nil,
    },
  }.to_json

  $response = HTTParty.post("#{@uri}/relatorios", body: @body, headers: @header)
end

Quando("Eu envio o verbo GET para validar as consultas de um relatorio inexistente") do
  @num_relt = CONFIG["inv_relt"]
  $response = HTTParty.get("#{@uri}#{@api}/#{@num_relt}", headers: @header)
end

Quando("Eu envio o verbo POST para validar a aprovacao manual sem o parametro") do
  @num_relt = Relatorio_Pessoa.numero.parsed_response["result"]["numero"]
  @body = {
    "aprovar": nil,
    "mensagem": "Relatório aprovado com sucesso",
  }.to_json
  $response = HTTParty.post("#{@uri}#{@api}/validar/#{@num_relt}", body: @body, headers: @header)
end

Quando("Eu envio o verbo POST para validar a aprovacao manual diferente do esperado") do
  @num_relt = CONFIG["inv_relt"]
  @body = {
    "aprovar": true,
    "mensagem": "Relatório aprovado com sucesso",
  }.to_json
  $response = HTTParty.post("#{@uri}#{@api}/validar/#{@num_relt}", body: @body, headers: @header)
end
