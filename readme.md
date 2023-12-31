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

---

### Atalhos Dephi

  **Ctrl + Shift + G** Gera assinatura de uma interface. Procedimento: ir logo abaixo de uma declaração de uma interface e pressionar o conjunto de teclas simultaneamente.

  **Ctrl + Shift + A** Importa de onde a Interface, Classe e etc... foi implementada para cláusula **uses**. Procedimento: selecione a palavra que deseja buscar, e pressione o conjunto de teclas simultaneamente.

  **Ctrl + Shift + C** Adiciona as implementações das  Functions ou Procedures com assinaturas declaradas. Procedimento: ir na linhas das declarações das function ou procedures e pressione o conjunto de teclas simultaneamente.

  **Alt + F11**  Abre interface para implementar o uso de um outro arquivo do projeto que ainda não esteja em uso no arquivo aberto.

  Formas de implementar:

  Interfaces ou Implementation