# Desafio de Automação de API - IDWALL
Este projeto foi desenvolvido utilizando Cucumber, HTTParty e WebDriver frameworks para automação de back-end.

## Passo 1:
Instalar:
<blockquote>Ruby 2.5.5 e DevKit (https://rubyinstaller.org/downloads/)</blockquote>
<blockquote>Bundler ($ gem install bundler)</blockquote>

## Passo 2:
Clonar o projeto:
    <blockquote>$ git clone git@github.com:joicequeiroz/desafio-qa.git</blockquote>

## Passo 3:
Após clonar o projeto, vai até o diretório raíz do projeto e execute o seguinte comando:
    <blockquote>$ bundle install</blockquote>

## Exemplo para rodar os testes:
Para rodar todos os cenários, execute o seguinte comando:
    <blockquote>$ cucumbert</blockquote>

Para rodar cenários específicos por funcionalidade, como Relatórios, execute o seguinte comando:
    <blockquote>$ cucumber --tag @relatorio</blockquote>

#### Após a execução dos testes, os resultados são armazenados em ..\desafios-qa\log\report.html

## Pontos de Atenção:
**1. Status Code**

Os códigos de status das respostas HTTP indicam se uma requisição HTTP foi corretamente concluída. As respostas são agrupadas em cinco classes: respostas de informações, respostas de sucesso, redirecionamento, erro do cliente e erros do servidor.

Idealmente o status code 200 é utilizado para:

Requisição bem sucedida. O significado do sucesso varia de acordo com o método HTTP:
GET: O recurso foi buscado e transmitido no corpo da mensagem.
HEAD: Os cabeçalhos da entidade estão no corpo da mensagem.
POST: O recurso descrevendo o resultado da ação e trasmitido no corpo da mensagem.
TRACE: O corpo da mensagem contem a mensagem de requisição recebida pelo servidor

No caso da api da IDWALL, esse código está retornando também para requisições de criação, no caso o verbo POST, é uma boa prática de mercado que o verbo de criação tenha retorno 201 Created para diferenciar das outras requisições.

O status code 204 é utilizado para:
Quando não há conteúdo para enviar para esta solicitação, mas os cabeçalhos podem ser úteis. O user-agent pode atualizar seus cabeçalhos em cache para este recurso com os novos.

No caso de cenários onde não é informado um dos campos obrigatórios, o ideal é o retorno do status 204 e não o status 400 - Bad Request, que significa que o servidor não entendeu a requisição pois está com uma sintaxe inválida.

**2. Documentação:**

De acordo com a documentação disponível em: https://docs.idwall.co/docs/listing-reports, é possível filtrar relatórios informando os dados no body na requisição, como por exemplo:
![Screenshot_27](https://user-images.githubusercontent.com/29778062/65064817-919edb00-d957-11e9-996c-11e7e0e288a1.png)

Porém, a requisição não funciona dessa forma, para montar uma requisição que realmente faça o filtro, é necessario informar 
``` 
curl -G https://api-v2.idwall.co/relatorios?page=1&rows=25&tipo_pessoa=Pessoa
-H "Content-Type: application/x-www-form-urlencoded"
-H 'Authorization:seu-token'
```

É necessário atualizar a documentação no site para não prejudicar os testes dos demais canditados.

## Registro de defeitos
Caso de Teste | Resultado esperado | Resultado obtido | Severidade
------------- | ------------------ |----------------- |------------
POST para validar a aprovacao manual sem o parametro| Sistema deve retornar o status_code 400 e a mensagem "Bad Request"| O sistema retornou o status code 404 e a mensagem "Not Found| Normal
GET para listar relatórios por Nome Matriz Pessoa| Sistema deve retornar todas as matrizes correspontente à "consultaPessoaDefault"| O sistema retorno a consulta vazia, analisando o problema, o campo nome está trocado com o campo "título", filtrando por ""Relatório padrão PF" o sistema retorna todas as matrizes de Pessoa| Normal
GET para listar relatórios por Nome Matriz Empresa| Sistema deve retornar todas as matrizes correspontente à "consultaEmpresaDefault"| O sistema retorno a consulta vazia, analisando o problema, o campo nome está trocado com o campo "título", filtrando por ""Relatório padrão PJ" o sistema retorna todas as matrizes de Pessoa| Normal
GET para listar relatorios por Resultado VALID| Sistema deve retornar todos os relatórios com resultado igual à VALID| O sistema não está filtrando por VALID, está retornando também INVALID| Normal
GET para listar relatorios por Resultado INVALID| Sistema deve retornar todos os relatórios com resultado igual à INVALID| Como o sistema está retornando todos os status, e todos estão como INVALID, não temos como saber se está filtrando ou não, no caso esse cenário é um falso positivo| Normal
GET para listar relatorios por ordenacao crescente| Sistema deve retornar todos os relatório de acordo com o filtro aplicado, na ordem crescente| O sistema não está aplicando a ordem crescente em conjunto com o filtro| Normal
GET para listar relatorios por ordenacao decrescente| Sistema deve retornar todos os relatório de acordo com o filtro aplicado, na ordem decrescente| O sistema não está aplicando a ordem decrescente em conjunto com o filtro| Normal
