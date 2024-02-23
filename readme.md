# Small Trainning Delphi

## Boas Vindas (1 Aulas)

### Grupo de Alunos

## Orientação a Objetos, Fluent Interface e Padrões de Projeto (14 Aulas)

### O que iremos ver no Small Trainning

### Pensar na aplicação antes de escrever

### Criando projeto de pedidos e promoção

  Criando um projeto e demonstrando a forma RAD de desenvolvimento com as implementações todas dentro do componente.

### Usando Interface para trabalhar validações de regras

  Utilizando o projeto já criáo e refatorando a funcionalidade demonstrada no modo RAD, criando uma interface.
  
  Criação da Interface: Produto.Interfaces.pas
  
  Criação da Classe: Produto.pas

### Eliminando casting na view

  Exemplicação do padrão de projeto Fluente.

  Programação funcional.

  Exemplo de polimorfismo com a reescrita do método para trabalhar o cast em strings.

  **IF** imutável, é o tipo em que se aplica a utilização de ifs.

### Validando e dando foco no componente visual

  Desenvolvido um método com um esboço de como setar o focus em um componente após exception.

### Centralizando regras fiscais com helpers

  Utilizando o: Helper

  O Helper permite que seja implementado funcionalidades a mais, dentro de componentes já existentes no Delphi. 
  
  Para o exemplo em questão o TComboBox.

  Adicionado comportamento no componente de acordo com o que for preenchido no Enum.

### Utilizando eventos para exibir mensagem na tela

  Criando function utilizando TProc<>

  TProc<> é um método anônimo.

### Especializando a classe de regras fiscais

  Especialização da classe Produto

  Criação das classes de impostos:
  SimplesNacional e LucroReal

  Criação de CodeTemplate. Para criação as explicações estão nesta aula. 

### Especializando o Enumerado com as classes helpers

### Compreendendo o objetivo da classe fechada para modificação e aberto para expanção

  Criação da classe de imposto:
  LucroPresumido

### Implementando classe de gravação de log

  Reestruturação das pastas do projeto.

  Criação da pasta src, com suas sub-pastas **\Model**, **\Log**, **\Produto**

  Implementação da classe de interface de log: 
  
  Model.Log.Interfaces

  Model.Log.Texto

  Não será usado o Fluente para chamar o log e sim o **Decorator**

  Implementada a classe:

  Model.Log

### Preparando a classe de log para expansão com o padrão decorator

  Modificando os Constructo, Destructor e class Function New.

  Inserindo no **private** uma variável para fazer uma injeção de dependência. Com o mesmo tipo da interface iLog.

  Refatoração para padrão com Decorator:

  Model.Log.pas
  
  ```
  private
    FDecorator : iLog;
  public
    constructor Create(Decorator : iLog = nil);
    class function New(Decorator : iLog = nil) : iLog;    
    class function TLog.New(Decorator : iLog = nil) : iLog;
  begin
    //Result := Self.Create;
    Result := Self.Create(Decorator);
  end;

  constructor TLog.Create(Decorator : iLog = nil);
  begin
    FDecorator := Decorator;
  end;

  function TLog.Gravar(aValue: String): iLog;
  begin
    //TLogTexto.New.Gravar(aValue);
    TLogTexto
      .New(
        TLogCsv.New
      ).Gravar(aValue);

  end;
  ```

### Fontes do módulo

## MVC e Refatoração de Projetos (32 aulas)

### Destravar é preciso

### Overview do PDV totalmente RAD

### Criando a camada view

  Primeiro passo da refatoração de um projeto RAD, é retirar a conexão do banco de um componente e criar a classe de conexão.

  Para monitorar possíveis despejos/vazamentos de memoria inserir um:
  
  ```
  ReporteMemoryLeakOnShutdown := True;  
  ```

  Segundo, cria as pastas para o MVC:

  \Model\Connection\Firedac
   
  \View\Forms

  \Controller


### Entendendo a estrutura de um projeto com vida longa	

  Conforme boas práticas do clean code que seria trabalhar orientado a interface e não a uma classe.

  Explicações com diagrama(LucidChart) das conexões entre as camadas MVC.


### Implementando as conexões

  Firedac: Implementando a classe de conexão.

  Utilizando padrão de projeto singleton para a conexão.

### Como utilizar um ORM em sua aplicação

  Utilizando o SimpleORM para criação de JSON. Passo a passo de como add o SimpleORM do github e add no Delph.

  Criação das entidades pasta **\Entity** no projeto.

  SimpleORM transforma os objetos em SQL.

### Criando o DAO genérico

  Criando o DAO para o SQL.

  Explicação do funcionamento da Classe e da Interface.

### Considerações da classe DAO genérica

  Explicações de como implementar para os diversos modos de tecnologias, explicação panorâmica. Sem detalhes técnicos. Pegado a ideia do funcionamento.


### Entendendo como funciona os métodos do DAO

  Utilizar o SimpleORM que já possuir o DAO, que será re-utilizado.

  Criando uma conexaão buscando os dados a partir da conexão pela classe e trazendo os dados no grid.

### Implementando os métodos da classe DAO do SQL

  Implementando:

  New

  Insert

  Update

  Delete

  Através do objeto.

  Métodos Find's por: Id, Por lista de objetos todos com (overload) sobrecarga do método find.

  Método Query

  Método DataSet

  Método LastId

  Método DataChange

  Métodos declarado mas implementação serão nas próximas aulas.

### Implementando o Controller de objeto genérico

### Criando o Controller que a view irá trabalhar

### Implementando as requisições da view ao controller

  Overview do projeto até o momento.

  Retirada de vários acomplamentos do form principal.

  Explicações da conexão e como o projeto está organizado.
  
### Considerações das possíveis opções para o DAO

### O beneficio da organização da construção da tela


### Especializando o controllers do caixa

###

###




---
---

## Atalhos Dephi

  **Ctrl + Shift + G** Gera assinatura de uma interface. Procedimento: ir logo abaixo de uma declaração de uma interface e pressionar o conjunto de teclas simultaneamente.

  **Ctrl + Shift + A** Importa de onde a Interface, Classe e etc... foi implementada para cláusula **uses**. Procedimento: selecione a palavra que deseja buscar, e pressione o conjunto de teclas simultaneamente.

  **Ctrl + Shift + C** Adiciona as implementações das  Functions ou Procedures com assinaturas declaradas. Procedimento: ir na linhas das declarações das function ou procedures e pressione o conjunto de teclas simultaneamente.

  **Ctrl + Shift + Alt + P** 
  Atualiza as modificação feitas na assinatura, replicando para as implementações das  Functions ou Procedures. Procedimento: ir na linha ou selecionar assinatura que teve modificação na sua declaração. Pressione o conjunto de teclas simultaneamente.

  **Alt + F11**  Abre interface para implementar o uso de um outro arquivo do projeto que ainda não esteja em uso no arquivo aberto.

  Formas de implementar:

  Interfaces ou Implementation