#encoding: utf-8
#language: pt

@manual
Funcionalidade: Validação Manual
    Como QA
    Eu quero aprovar/reprovar um Relatorio manualmente
    Para validar as funcionalidades

    Contexto: Endpoint
    Dado Eu recebo o endpoint de validar relatorios "/relatorios"

    @teste
    Cenário: Aprovar 
    Quando Eu envio o verbo POST para aprovar manualmente um relatorio
    Então terei o retorno do status code "200"

    @teste
    Cenário: Reprovar
    Quando Eu envio o verbo POST para reprovar manualmente um relatorio
    Então terei o retorno do status code "200"