# Pontos Gerais

## Um pouco da história...
Quando se fala de ciclo de vida de desenvolvimento de software, vimos modelos como Cascata, Modelo em V, Incremental, Evolutivo, RAD, Prototipagem, Espiral, RUP e diversos outros que surgiram e minguaram. Uma característica comum entre esse modelo, é a grande quantidade de documentação como: casos de uso, diagramas de classe, sequência, atividade, processo e outros, mas muito voltado para o desenvolvedor e a forma de desenvolvimento.

Dentro desse contexto, quase sempre a Qualidade não era levada como prioridade, normalmente a fase de testes era curta (quando existia) e acontecia ao final do cluclo de desenvolvimento, próximo às entregas do produto. Isso é um forte indicador de que os testes geralmente não eram realizados com eficiência.

Nesse cenário, surgiu o perfil de profissional voltado para a Qualidade de Software, conhecido como Analista de Qualidade, e outros nomes que existiam de acordo com a função.

O profissional de QA deveria possuir um perfil que pudesse efetuar uma boa comunicação, aplicar conceitos, processos, definir, priorizar, analisar, executar testes manuais, gerenciar ferramentas e ciclo de execução. Conhecimento técnico em ferramentas e desenvolvimento assim como engenharia de software não eram exigidos e tão pouco utilizados pela maioria dos profissionais da época.

Nosso ambiente mudou, evoluímos muito, e agora estamos inseridos em novos contextos de desenvolvimento com uma enorma diversidade de ferramentas, metodologias, linguagens e negócios cada vez mais complexos e dinâmicos.

A preocupação do time com a *experiência do usuário* tomou enormes proporções, colocando a qualidade como peça fundamental do ciclo de vida do produto e elevando o QA a um papel de destaque.

Hoje a realidade da qualidade de software é bastante diferente. Testes automatizados são uma obrigação; a virtualização de serviços está aí para permitir os diversos tipo de testes; a necessidade de qualidade chegou ao mundo do IoT - Internet das Coisas; os testes devem atender às demandas de Mobile e Multiplataformas; e o mundo da Qualidade de Software está sendo fortemente impactado pela aterisagem da Inteligência Artificial.

Diante de uma demanda crescente por Qualidade, o menor caminho está para aqueles que já atuam com teste da forma tradicional e para os desenvolvedores que desejam trabalhar com qualidade, pois o primeiro já sabe o que o usuário quer, enquanto o segundo tem o expertise de programação.
Agora, todo mundo coda!

## BDD
É uma técnica de desenvolvimento de software ágil que surge através de uma crítica de Dan North ao TDD (Test Driven Development), onde ele visava otimizar o conceito de *verificação e validação*, já aplicado, e tornar mais eficiente a contrução de cenários a serem testados e/ou desenvolvidos.

Para Kent Back, criador do TDD, os testes devem ser escritos antes do código, assim irão falhar. Logo após, os desenvolvedores irão se basear nestes cenários falhos, irão implementar a aplicação de maneira a fazer os testes passar, e refatorar seu código até que fique limpo. De maneira cíclica. O que foi chamado de Red-Green-Refactor.

E está correto, porém a grande vantagem desta prática não é gerar testes, e sim, pensar no design e nas regras de negócios antes de escrever qualquer linha de código.

Assim surge o BDD, como uma prática que levaria o time de desenvolvimento a pensar no *comportamento do usuário* para entender o que deve ser feito. E atualmente através de conceitos e ferramentas, ele já pode ser aplicado por todos os membros do time, e não apenas pelos desenvolvedores.

## Planejamento dos testes
Os benefícios proporcionados pela aplicação de teste ágil tendem a ser extraordinários quando explorados da forma correta, com as práticas e técnicas corretas, e sob a análise correta dos recursos, infraestrutura, ambiente, framework e ferramentas a serem utilizados e aplicados no ciclo de vida de desenvolvimento do software.

A sistemática de teste aplicada tende a ser mais ousada e dinâmica, fornecendo feedbacks constante a equipe de desenvolvimento, que passa a se comprometer também com a qualidade do produto final, por meio dda implementação de testes de unidade (TDD).

É comum ao se aplicar teste ágil, confundir o conceito de "agilidade" com "rapidez", quando na realidade está atrelado à "qualidade" e "integridade" dos artefatos finais entregues. Ao se aplicar uma abordagem ágil, as iterações tendem a ser menores, assim como as entregas tendem a ser efetuadas em um curto prazo de tempo, no entanto cabe a equipe de teste em conjunto com as demais áreas garantir a consistência e qualidade final do produto gerado, assim como a satisfação do cliente diante das suas expectativas. Isso pode ser feito de várias formas, inclusive atráves da adoção das práticas de TDD e ATDD.

Em cada projeto desenvolvido, pode-se observar um conjunto de variáveis que influenciam diretamente nas decisões tomadas antes, durante e após o projeto, muitas vezes a favor e outras vezes contra a adoção da abordagem ágeis de desenvolvimento. No entanto, o que se pode observar, é que o "teste ágil" é uma realidade viável que pode extrair o melhor da equipe e do processo aplicado, fornecendo retorno imediato e a curto prazo diante da sistemática de teste adotada.

## Automação dos Testes
A automação de testes, sem dúvida, é uma boa prática em um processo de teste de software. No entanto, a automação de teste não é uma prática que se adota do dia para a noite. A necessidade de automatizar os testes virá naturalmente como resultado da evolução da maturidade do processo de teste.

A automação de testes tem o objetivo de reduzir o envolvimento humano em atividades manuais repetitivas. Entretanto, isto não significa que a automação de testes deve se limitar apenas a fazer o trabalho repetitivo e chato. Os casos de testes manuais foram criados num contexto onde os testes seriam executados manualmente. É muito provavél que estes casos de testes manuais não sejam muito eficientes em um contexto onde os testes serão executados automaticamente.

Frequentemente, antes de iniciar a automação, os testes devem ser re-projetados a fim de aumentar a probabilidade de revelar um defeito que ainda não tenha sido encontrado. Afinal, o grande benefício da automação de testes é a execução dos testes serem mais rápidas e a qualquer hora do dia ou da noite, mas o aumento da amplitude e profundidade da cobertura dos testes.

Na prática, a automação de 100% dos testes manuais nem sempre é a melhor estratégia. A automação de testes é pouco eficaz quando os testes são complexos e exigem interações intersistemas ou validações subjetivas (estes tipos de testes devem permanecer manuais). Além disso, muitas vezes o custo e o tempo para automatizar os testes de um projeto são maiores que o custo e o tempo do próprio projeto de desenvolvimento (o que inviabilizaria a automação de 100% dos testes manuais).

## Métricas de Qualidade
Avaliar a qualidade de um software é um minstério. Muitos profissionais de TI ficam frustrados sobre como definir a qualidade das aplicações. Não surpreendentemente, essas dificuldades resultam de um foco incorreto sobre o processo pelo qual o software foi construido. De nada adianta ter um processo impecável se o produto não estiver na linha. Infelizmente, esse é o tipo de falha que corremos o risco quando não somos capazes de medir a qualidade de software.
Um software bem concebido, bem arquitetado e bem executado possui alta qualidade. É fácil trabalhar com ele, mantê-lo para suprir as demandas do negócio.  
Listaremos 5 pontos para medir a qualidade:

**1. Alcance:**
Deve ser capaz de lidar com várias tecnologias. A maioria dos aplicativos modernos contém vários idiomas e sistemas que são ligados entre si de forma complexa.

**2. Profundidade:**
Deve ser capaz de gerar mapas completos e detalhados da arquitetura do aplicativo do Graphical User Interface (GUI), ferramenta de captura, processamento e análise de imagem, para o banco de dados. Sem essa detalhada arquitetura, seria impossível obter contextualização da aplicação.

**3. Tornar o conhecimento explícito de engenharia de software:**
Deve ser capaz de verificar a aplicação inteira contra centenas de padrões de implementação que codificam as melhores práticas de engenharia.

**4. Métricas acionáveis:**
As métricas de qualidade não devem apenas informar, mas também orientar sobre como realizar a melhoria da qualidade do software, mostrando o que fazer primeiro, como fazê-lo, próximos passos etc.

**5. Automatização:**
Finalmente, deve ser capaz de realizar todos os pontos descritos acima de forma automatizada. Nenhum profissional ou equipe pode fazer essa tarefa, muito menos fazê-la em um curto espaço de tempo.

## Conclusão
Todos somos responsáveis pela qualidade e sucesso de um produto e a comunicação é essencial durante esse processo. É preciso deixar muito claro as expectativas e o como vamos fazer para alcançá-los. 
Tendo em vista que, a qualidade precisa ser mensurada e devemos atuar no gaps e controlar os riscos levantados antes e durante o ciclo de vida do desenvolvimento.
