#encoding: utf-8
#language: pt

@status
Funcionalidade: Status
    Como QA
    Eu quero o verificar o status
    Para validar as funcionalidades

    Contexto: Endpoint
    Quando Eu recebo o endpoint de status "/status"

    @teste
    Cenário: API
    Quando Eu envio o verbo GET para buscar o status da API
    Então terei o retorno do status code "200"

    @teste
    Cenário: Fontes
    Quando Eu envio o verbo GET para buscar o status das fontes
    Então terei o retorno do status code "200"

    @teste
    Cenário: Fontes por Matriz
    Quando Eu envio o verbo GET para buscar o status das fontes por matriz
    Então terei o retorno do status code "200"