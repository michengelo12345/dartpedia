/*-------------------------------------------------------------------------------------------------------------------------------
|																|
| Informacoes:  														|
|																|
| O aplicativo cli faz parte do projeto Dartpedia.										|
| 																|
| O cli eh nosso primeiro aplicativo que esta sendo desenvolvido usando Dart. 							|
|																|
| cli.dart - Fica localizado na pasta dartpedia, em /dartpedia/cli/bin.								|
| 																|
| Outras informacoes importantes sobre o cli; nosso aplicativo.									|
|																|
| site		:														|
|																|
| Autor		: Michelangelo Rasa Neto <michelangleo.neto@aluno.senai.br>							|
|																|
| Manutencao	: 														|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Funcionamento:														|
|																|
| Inicialmente o cli, ao ser executado, mostra uma saudacao na tela, por exemplo:						|
|																|
| Dentro da pasta dartpedia em /home/michelangelo.neto/dartpedia/cli rode o comando						|
| dart run; deve aparecer a mensagem de saudacao, "Hello, Dart!"								|
|																|
| Obs. Importante ! Este aplicativo estah em desenvolvimento e ao longo do tempo o						|
| comportamento do aplicativo pode mudar.											|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Dicionario do Versionamento:													|
|																|
| v = versao															|
|																|
| 0 = Inicio do versionamento													|
|																|
| . = Implementacao de versionamento												|
|																|
| 1 = Proxima versao, 2, proxima versao, e assim por diante.									|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Historico do Versiionamento:													|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.0															|
|																|
| Data: 27/03/2026 														|
|																|
| Descricao do codigo: Codigo original....											|
|																|
/ Codigo:															\
																
 import 'package:cli/cli.dart' as cli;												
																
 void main(List<String> arguments) {												
	print('Hello world: ${cli.calculate()}!');										
																
 }																
																
\ Saida padrao ao executar o codigo: 												/
|																|
| Building package executable...												|
| Built cli:cli.														|
| Hello world: 42!														|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.1															|
|																|
| Data: 27/03/2026														|
| 																|
| Descricao da atualizacao: Simplifique a saida. Apague a primeira linha, ...import...						|
| e troque a saudacao para "Hello, Dart!".											|
|																|
/ Codigo:															\
																
void main(List<String> arguments) {												
	print('Hello, Dart!');													
}																
																
\ Saida padrao ao executar o codigo:												/
|																|
| Building package executable...												|
| Built cli:cli.														|
| Hello, Dart!															|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.2															|
|																|
| Data: 06/04/2026														|
|																|
| Descricao da atualizacao: Implementar comandos de versao e ajuda								|
| 																|
/ Codigo:															\
																
const version = '0.0.2'; 													
																
void main(List<String> arguments) {												
	if (arguments.isEmpty) {												
    		print('Hello, Dart!');												
  	} else if (arguments.first == 'version') {										
    		print('Dartpedia CLI version $version');									
  	}															
}																
																
\																/
| Saida ao executar o codigo: (Execute sua aplicacao com o argumento de versao: dart bin/cli.dart version).			|
| Obs. Importate !! Se voce executar seu aplicativo sem argumentos, ainda vera "Ola, Dart!". Voce devera ver agora:		|
|																|
| Dartpedia CLI version 0.0.2													|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.3															|
|																|
| Data: 06/04/2026														|
|																|
| Descricao da atualizacao: Adicione uma printUsage funcao. Para tornar a saida mais amigavel ao usuario, 			|
| crie uma funcao separada para exibir as informacoes de uso.									|
|																|
/ Codigo:															\
																
 const version = '0.0.3'; // Add this line											
																
 void main(List<String> arguments) {												
	if (arguments.isEmpty) {												
		print('Hello, Dart!');												
	} else if (arguments.first == 'version') {										
		print('Dartpedia CLI version $version');									
	}															
																
 }																
																
 void printUsage() { // Add this new function											
  print("The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");					
 }																
																
\																/
| Saida ao executar o codigo: Perguntas: O que acontece ao executar este codigo, com o comando Dart run ? 			|
| E o comando dart run cli.dart version ? Como executo o help ? E o search ?							|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.4															|
|																|
| Data: 06/04/2026														|
|																|
| Descricao da atualizacao: Implemente o help comando e refine main: Agora, 							|
| integre o help comando usando uma else if instrucao e limpe o comportamento padrao para chamara printUsage funcao.		|
|																|
|																|
/ Codigo:															\
																
const version = '0.0.4'; // Add this line											
																
void main(List<String> arguments) {												
	if (arguments.isEmpty || arguments.first == 'help') {									
		printUsage(); // Change this from 'Hello, Dart!'								
	} else if (arguments.first == 'version') {										
		print('Dartpedia CLI version $version');									
	} else {														
	printUsage(); // Catch-all for any unrecognized command.								
}																
																
void printUsage() { // Add this new function											
	print(															
	"The following commends are valid: 'help', 'version', 'search >ARTICLE-TITLE>'");					
}																
																
\ Saida ao executar o codigo: 1 -> dart bin/cli.dart help. Tente tambem, 2 -> dart bin/cli.dart.				/
|																|	
| Saida 1 -> The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>					|
|																|
| Saida 2 -> The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>					|
|																|
| Obs. Importante na saida ao executar o codigo: Observe que as informacoes de uso continuam sendo exibidas.			|
| Neste ponto, qualquer comando que voce nao tenha definido tambem exibira informacoes de uso.					|
| Este eh o comportamento esperado por enquanto.  										|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.5															|
|																|
| Data: 06/04/2026														|
|																|
| Descricao da atualizacao: Implementar o comando de busca.									|
|																|
| Implemente um comando basico search que receba o titulo de um artigo como entrada.						|
| Ao desenvolver essa funcionalidade, voce trabalhara com List manipulacao de dados, 						|
| verificacao de valores nulos e interpolacao de strings.									|
|																|
| 1. Integre o search comando em main: Primeiro, modifique a mainfuncao cli/bin/cli.dart					|
| para incluir um else if que lide com o search comando.									|
| Por enquanto, basta imprimir uma mensagem de espaco reservado.								|
|																|
/ Codigo:															\
																
const version = '0.0.5'; // Add this line											
																
void main(List<String> arguments) {												
  if (arguments.isEmpty || arguments.first == 'help') {										
    printUsage();														
  } else if (arguments.first == 'version') {											
    print('Dartpedia CLI version $version');											
  } else if (arguments.first == 'search') {											
    // Add this new block:													
    print('Search command recognized!');											
  } else {															
    printUsage();														
  }																
}																																
void printUsage() { // Add this new function											
  print(															
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"						
  );																
}																
																
\ Saida ao executar o codigo: Teste o novo comando: Execute sua aplicacao com o search comando:					/
|																|
| dart bin/cli.dart search													|
|																|
| Voce devera ver:														|
|																|
| Search command recognized!													|
|																|
--------------------------------------------------------------------------------------------------------------------------------|
|																|
| Versao: 0.0.6															|
|																|
| Data: 07/04/2026														|
|																|
| Descricao da atualizacao: Defina a search Wikipedia funcao: O search comando eventualmente 					|
| executara a logica principal do seu aplicativo chamando uma funcao chamada search Wikipedia.					|
| Por enquanto, faca com que ela search Wikipedia imprima os argumentos passados para ela com o search comando.			|
|																|
| Coloque esta nova funcao abaixo de main.											|
|																|
| // ... (your existing main function)												|
|																|
| void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type				|
|  print('searchWikipedia received arguments: $arguments');									|
| }																|
|																|
| // ... (your existing printUsage() function) 											|
|																|
|																|
/ Codigo:															\
																

const version = '0.0.6'; // Add this line											
																
void main(List<String> arguments) {												
	if (arguments.isEmpty || arguments.first == 'help') {									
    		printUsage();													
  	} else if (arguments.first == 'version') {										
    		print('Dartpedia CLI version $version');									
  	} else if (arguments.first == 'search') {										
    	// Add this new block:													
	final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;							
    		searchWikipedia(inputArgs);											
	} else {														
    		printUsage();													
  	}															
}																
																
void searchWikipedia(List<String>? arguments) { // Add this new function and add ? to arguments type				
  print('searchWikipedia received arguments: $arguments');									
}																
																
void printUsage() { // Add this new function											
  	print(															
    	"The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");					
}																


\																/
---------------------------------------------------------------------------------------------------------------------------------






// Codigo:

const version = '0.0.6'; // <-- Adicionado esta linha na versao '0.0.2'

void main(List<String> arguments) {
	if (arguments.isEmpty || arguments.first == 'help') {
		printUsage();
	} else if (arguments.first == 'version') {
		print('Dartpedia CLI version $version');
	} else if (arguments.first == 'search') {
	// <-- Adicionado este bloco de codigo na versao '0.0.6:
	final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
		searchWikipedia(inputArgs);
	} else {
		printUsage();
	}
}

void searchWikipedia(List<String>? arguments) { // <-- Adicionado esta nova funcao e argumento do tipo "?" na versao '0.0.6'
print('searchWikipedia received arguments: $arguments');
}

void printUsage() { // <-- Adicionado esta funcao na versao '0.0.3' e '0.0.4'
	print(
	"The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'");
}
*/

//																|
// ------------------------------------------------------------------------------------------------------------------------------

//Mudanças da tarefa 02 - importar pacotes http

import 'dart:io'; // <-- importamento do dart.io - adicionado nesta versão (0.0.7)
import 'package:http/http.dart' as http; // <--- importando pacotes http adicionado nesta versão (0.0.7)

const version = '0.0.7';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) {
  print('searchWikipedia received arguments: $arguments');
}

void printUsage() {
  print(
    "The following commands are valid: "
    "'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}

// */
// ----------------------------------------------------------------------------------------------------------------------------- |


