#encoding: utf-8
#language: pt

@empresa
Funcionalidade: Empresas
    Como QA
    Eu quero listar as Empresas
    Para validar a funcionalidade

    Contexto: Endpoint
    Quando Eu recebo o endpoint de empresas "/empresas"

    @teste
    Cenário: Listar todas
    Quando Eu envio o verbo GET para buscar todos as empresas
    Então terei o retorno do status code "200"

    @teste
    Cenário: Listar por CNPJ
    Quando Eu envio o verbo GET para buscar uma empresa por CNPJ
    Então terei o retorno do status code "200"