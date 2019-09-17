#encoding: utf-8
#language: pt

@pessoas
Funcionalidade: Pessoas
    Como QA
    Eu quero listar as pessoas
    Para validar a funcionalidade

    Contexto: Endpoint
    Quando Eu recebo o endpoint de pessoas "/pessoas"

    @teste
    Cenário: Listar todas
    Quando Eu envio o verbo GET para buscar todos as pessoas
    Então terei o retorno do status code "200"

    @teste
    Cenário: Listar por CPF
    Quando Eu envio o verbo GET para buscar CPF
    Então terei o retorno do status code "200"