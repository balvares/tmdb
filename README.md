# **The Movie Database**
Aplicativo para explorar um catálogo de filmes e séries.

## **Sumário**
 - Instalação
 - Como rodar
 - Arquitetura
 - Linguagem e tecnologias utilizadas
 - Soluções técnicas

## Instalação
Faça o download do repositório, entre na pasta, abra o prompt de comando e digite:

    flutter pub get
Este comando irá buscar as dependências utilizadas no projeto.

## Como rodar
Com um dispositivo conectado à máquina ou um emulador em execução, abra o prompt de comando na pasta do projeto e execute:

    flutter run

## Arquitetura
Este aplicativo foi desenvolvido seguindo os princípios da Clean Architecture, proposta por Robert C. Martin. A Clean Architecture visa criar um código fonte que seja independente de frameworks, UI e databases, facilitando a manutenção e testabilidade do sistema.
**Camadas:**

 - Domain: contém as estruturas de dados;
 - Datasource: acesso às APIs;
 - Repository: acesso aos datasources, chamadas de métodos com seus devidos filtros;
 - Usecase:	comportamentos (métodos) encapsulados que acessam os repositórios;
 - Controller:	lógica de negócio, chamada aos casos de uso, formatações em geral;
 - Presenter: UI.

## Linguagem e Tecnologias utilizadas
- Flutter
- Dart
- Bibliotecas externas: `get` (v4.6.5), `intl` (any), `google_fonts` (v4.0.3), `flutter_dotenv` (v5.1.0), `json_annotation` (v4.8.0) e `mockito` (v5.4.4).

## Soluções técnicas
O GetX oferece um poderoso sistema de gerenciamento de estado, permitindo que os widgets reajam automaticamente a mudanças no estado do aplicativo. Aqui está como foi implementado o gerenciamento de estado:

**Gerenciamento de estado e Injeção de Dependências**
 1. **Controllers**: Utilizei controllers para gerenciar o estado de diferentes partes da aplicação. Os controllers são classes que estendem `GetxController` e são responsáveis por armazenar e atualizar o estado.
3. **Observáveis**: Utilizei observáveis para monitorar mudanças no estado. Com o sufixo `.obs`, posso monitorar automaticamente as mudanças nas variáveis.
4. **Bindings**: Utilizei a classe `Bindings` para realizar a injeção de dependências. As bindings são responsáveis por fornecer instâncias de controllers ou outros objetos necessários às páginas do aplicativo.
5. **Lazy Loading**: Utilizei o método `Get.lazyPut` para realizar a injeção de dependências de forma que as instâncias só são criadas quando são necessárias.

**Navegação**
 1. **Definição de Rotas**: Utilizei o método `GetMaterialApp` para definir as rotas iniciais do aplicativo. Cada rota é associada a um nome que pode ser usado para navegá-la em qualquer lugar do aplicativo.
 2. **Navegação**: Para navegar entre as telas, utilizei o método `Get.toNamed` passando o nome da rota definida anteriormente.

**Rotas dinâmicas** 

 1. **Parâmetros**: Utilizei o parâmetro `parameters` ao navegar entre as telas para passar dados dinâmicos.
 2. **Recuperação de Parâmetros**: Para recuperar os parâmetros na tela de destino, utilizei o método `Get.parameters`.

### Conclusão

A utilização do GetX simplificou significativamente a navegação, o gerenciamento de estado, a injeção de dependências e a definição de rotas em nosso aplicativo Flutter, tornando-o mais limpo, modular e fácil de manter.