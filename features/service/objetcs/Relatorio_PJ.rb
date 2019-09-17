class Relatorio_Empresa
  include HTTParty

  def self.numero
    @uri = URL.query_service("api")
    @token = CONFIG["token"]
    # @dta_nasc = Faker::Date.birthday(min_age: 18, max_age: 65).strftime("%d/%m/%Y")
    # @nome = Faker::Movies::HarryPotter.character
    @cnpj = Faker::Company.brazilian_company_number(formatted: false)
    @header = { 'Content-Type': "application/json",
                'Authorization': "#{@token}" 
              }
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
          "cnpj_numero": @cnpj,
          "cpf_data_de_nascimento": nil,
          "cpf_estado_civil": nil,
          "cpf_nome": nil,
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
          "rntrc": nil
      }
  }.to_json

    $response = HTTParty.post("#{@uri}/relatorios", body: @body, headers: @header)
  end
end
