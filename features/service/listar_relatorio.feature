#encoding: utf-8
#language: pt

@listar
Funcionalidade: Listar Relatorio
    Como QA
    Eu quero listar os tipos de busca de Relatorio
    Para validar as funcionalidades
    
    Contexto: Endpoint
    Dado Eu recebo o endpoint de listar relatorios "/relatorios"
    
    @teste
    Cenário: Numero CPF
    Quando Eu envio o verbo GET para listar relatorios por CPF
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste @empresa_pj 
    Cenário: Numero CNPJ
    Quando Eu envio o verbo GET para listar relatorios por CNPJ
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste 
    Cenário: Tipo Pessoa
    Quando Eu envio o verbo GET para listar relatorios por Tipo Pessoa
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste @empresa_pj
    Cenário: Tipo Empresa
    Quando Eu envio o verbo GET para listar relatorios por Tipo Empresa
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste 
    Cenário: Nome Matriz Pessoa
    Quando Eu envio o verbo GET para listar relatorios por Nome Matriz Pessoa
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste @empresa_pj
    Cenário: Nome Matriz Empresa
    Quando Eu envio o verbo GET para listar relatorios por Nome Matriz Empresa
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste 
    Cenário: Resultado VALID
    Quando Eu envio o verbo GET para listar relatorios por Resultado VALID
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste 
    Cenário: Resultado INVALID
    Quando Eu envio o verbo GET para listar relatorios por Resultado INVALID
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste
    Cenário: Status 
    Quando Eu envio o verbo GET para listar relatorios por Status
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste @doing
    Cenário: Ordenacao Crescente
    Quando Eu envio o verbo GET para listar relatorios por ordenacao crescente
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste 
    Cenário: Ordenacao Decrescente
    Quando Eu envio o verbo GET para listar relatorios por ordenacao decrescente
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina