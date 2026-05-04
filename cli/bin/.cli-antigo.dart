/* cli.dart - V 0.0.1
#################################
# Nome: cli.dart		#
# Autor: Michelangelo Rasa Neto #
# Data: 06-04-2026		#
# Versão: 0.0.1			#
#################################

~---- Função ----~
Este arquivo tem como função executar um script simples que imprimirá um texto Hello World quando executado.
Entretanto, caso o usuário adicione algum argumento, o script imprimirá algo diferente, como sua versão por exemplo


// Exemplo de utilização \\
[Input] dart run cli.dart
[Output] Hello, world: 42!

______________________________________________Script_______________________________________________

import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) {
  print('Hello world: ${cli.calculate()}!');
}
*/


// ============================================================================================= \\


/* cli.dart - V 0.0.2
#################################
# Nome: cli.dart		#
# Autor: Michelangelo Rasa Neto #
# Data: 06-04-2026		#
# Versão: 0.0.2			#
#################################

~---- Função ----~
Este arquivo tem como função executar um script simples que imprimirá um texto Hello World quando executado.
Entretanto, caso o usuário adicione algum argumento, o arquivo e imprimirá algo diferente, como sua versão por exemplo

--------------------------+ Mudanças Versão 0.0.2 +---------------------------
| cli/lib/cli.dart não está sendo utilizado				     |
| Nada é calculado no print, portanto só imprime uma mensagem de Hello Dart! |
------------------------------------------------------------------------------

// Exemplo de utilização \\
[Input] dart run cli.dart
[Output] Hello, Dart!

___________________ Script: ____________________

void main(List<String> arguments) {
  print('Hello, Dart!');
}

*/


// ============================================================================================= \\


/* cli.dart - V 0.0.3
#################################
# Nome: cli.dart		#
# Autor: Michelangelo Rasa Neto #
# Data: 06-04-2026		#
# Versão: 0.0.3			#
#################################

~------------------------~ Descrição ~------------------------~
Este arquivo tem como função executar um script simples que imprimirá um texto Hello World quando executado.
Entretanto, caso o usuário adicione algum argumento, o arquivo e imprimirá algo diferente, como sua versão por exemplo

------------------------------------+ Mudanças Versão 0.0.2 +--------------------------------------
|												  |
| - cli/lib/cli.dart não está sendo utilizado							  |
| - Nada é calculado no print, portanto só imprime uma mensagem de Hello Dart!			  |
|												  |
------------------------------------+ Mudanças Versão 0.0.3 +--------------------------------------
|												  |
| - Argumento "version" é adicionado, e caso utilizado exibe a versão do comando		  |
|												  |
---------------------------------------------------------------------------------------------------

// Exemplo de Utilização 1 \\

[Input] dart cli.dart
[Output] Hello, Dart!

// Exemplo de Utilização 2 \\

[Input] dart cli.dart version
[Output] Dartpedia CLI version 0.0.3 

___________________ Script: ____________________

const version = '0.0.3';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello, Dart!');
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
}

*/


// ============================================================================================= \\



