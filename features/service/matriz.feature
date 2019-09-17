#encoding: utf-8
#language: pt

@matriz
Funcionalidade: Matriz
    Como QA
    Eu quero Configurar uma Matriz
    Para validar a funcionalidade

    Contexto: Endpoint
    Quando Eu recebo o endpoint de matrizes "/matrizes"

    @teste
    Cenário: Listar todas
    Quando Eu envio o verbo GET para buscar todas matrizes
    Então terei o retorno do status code "200"

    @teste
    Cenário: Detalhar
    Quando Eu envio o verbo GET para detalhar uma matrizes
    Então terei o retorno do status code "200"