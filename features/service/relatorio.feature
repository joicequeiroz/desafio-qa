#encoding: utf-8
#language: pt

@relatorio
Funcionalidade: Relatorio
    Como QA
    Eu quero criar um novo Relatorio
    Para validar as funcionalidades

    Contexto: Endpoint
    Dado Eu recebo o endpoint de relatorios "/relatorios"

    @teste 
    Cenário: Listar
    Quando Eu envio o verbo GET para listar todos os relatorio
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina
    
    @teste 
    Cenário: Listar Batches
    Quando Eu envio o verbo GET para listar os batches solicitados
    Então terei o retorno do status code "200"
    E a paginacao esta limitada a 25 registros por pagina

    @teste
    Cenário: Pendentes
    Quando Eu envio o verbo GET para listar todos os relatorios pendentes
    Então terei o retorno do status code "200"
    
    @teste
    Cenário: Detalhar
    Quando Eu envio o verbo GET para detalhar um relatorio
    Então terei o retorno do status code "200"

    @teste
    Cenário: Detalhes Batches
    Quando Eu envio o verbo GET para listar os batch especificos
    Então terei o retorno do status code "404" e a mensagem "Nenhuma solicitação de lote foi encontrada"

    @teste
    Cenário: Parametros
    Quando Eu envio o verbo GET para validar os parametros de um relatorio
    Então terei o retorno do status code "200"

    @teste
    Cenário: Consultas
    Quando Eu envio o verbo GET para validar as consultas de um relatorio
    Então terei o retorno do status code "200"

    @teste
    Cenário: Validações
    Quando Eu envio o verbo GET para validar as validações de um relatorio
    Então terei o retorno do status code "200"
    
    @teste
    Cenário: Dados
    Quando Eu envio o verbo GET para validar os dados de um relatorio
    Então terei o retorno do status code "200"
