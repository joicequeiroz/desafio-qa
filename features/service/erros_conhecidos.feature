#encoding: utf-8
#language: pt

@erros
Funcionalidade: Erros Conhecidos
    Como QA
    Eu quero verificar os erros conhecidos
    Para validar as funcionalidades

    Contexto: Endpoint
    Quando Eu recebo diversos endpoints
    
    @teste 
    Cenário: Acesso não Autorizado
    Quando Eu envio o verbo GET para buscar um relatorio
    Então terei o retorno do status code "401" e a mensagem "Falha na autenticação. Por favor verifique o token utilizado e se o acesso foi liberado."

    @teste
    Cenário: Criar relatório sem dados obrigatórios
    Quando Eu envio o verbo POST para criar um relatorio sem os dados obrigatórios
    Então terei o retorno do status code "400" e a mensagem "\"value\" must be an object"

    @teste
    Cenário: Criar relatório sem Matriz
    Quando Eu envio o verbo POST para criar um relatorio sem informar a Matriz
    Então terei o retorno do status code "400" e a mensagem "child \"matriz\" fails because [\"matriz\" must be a string]"

    @teste
    Cenário: Criar relatório sem Data de Nascimento
    Quando Eu envio o verbo POST para criar um relatorio sem informar a Data de Nascimento
    Então terei o retorno do status code "400" e a mensagem "Error: A matriz \"Relatório padrão PF\" requer que o campo \"Data de nascimento\" (\"parametros.cpf_data_de_nascimento\") seja fornecido."

    @teste
    Cenário: Criar relatório sem CPF
    Quando Eu envio o verbo POST para criar um relatorio sem informar do CPF
    Então terei o retorno do status code "400" e a mensagem "Error: A matriz \"Relatório padrão PF\" requer que o campo \"CPF\" (\"parametros.cpf_numero\") seja fornecido."

    @teste
    Cenário: Criar relatório sem CNPJ
    Quando Eu envio o verbo POST para criar um relatorio sem informar do CNPJ
    Então terei o retorno do status code "400" e a mensagem "Error: A matriz \"Relatório padrão PJ\" requer que o campo \"CNPJ\" (\"parametros.cnpj_numero\") seja fornecido."

    @teste
    Cenário: Relatorio nao encontrado
    Quando Eu envio o verbo GET para validar as consultas de um relatorio inexistente
    Então terei o retorno do status code "404" e a mensagem "Not Found"

    @teste
    Cenário: Aprovacao Manual sem parametro
    Quando Eu envio o verbo POST para validar a aprovacao manual sem o parametro
    Então terei o retorno do status code "400" e a mensagem "Bad Request"
 
    @teste
    Cenário: Aprovacao Manual não encontrado
    Quando Eu envio o verbo POST para validar a aprovacao manual diferente do esperado
    Então terei o retorno do status code "404" e a mensagem "Not Found"
    