#encoding: utf-8
#language: pt

@usuario
Funcionalidade: Usuário
    Como QA
    Eu quero o verificar os dados do usuario
    Para validar as funcionalidades

    Contexto: Endpoint
    Quando Eu recebo o endpoint de usuarios "/usuario"

    @teste
    Cenário: Perfil
    Quando Eu envio o verbo GET para buscar o perfil do usuário
    Então terei o retorno do status code "200"

    @teste
    Cenário: Crédito Disponíveis
    Quando Eu envio o verbo GET para buscar os créditos disponíveis
    Então terei o retorno do status code "406" e a mensagem "Sua conta não é do tipo Pré-pago."