import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'arguments.dart';
import 'exceptions.dart';

class CommandRunner {

  CommandRunner({this.onError});

  FutureOr<void> Function(Object)? onError;

  final Map<String, Command> _commands = <String, Command>{};

  UnmodifiableSetView<Command> get commands =>
      UnmodifiableSetView<Command>(
        <Command>{..._commands.values},
      );

  Future<void> run(List<String> input) async {

    try {

      final ArgResults results = parse(input);

      if (results.command != null) {

        Object? output =
            await results.command!.run(results);

        print(output.toString());
      }

    } on Exception catch(exception) {

      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }

  void addCommand(Command command) {

    _commands[command.name] = command;

    command.runner = this;
  }

  ArgResults parse(List<String> input) {

    ArgResults results = ArgResults();

    if (input.isEmpty) return results;

    if (_commands.containsKey(input.first)) {

      results.command = _commands[input.first];

      input = input.sublist(1);

    } else {

      throw ArgumentException(
        'The first word of input must be a command.',
        null,
        input.first,
      );
    }

    results.options = {};

    return results;
  }

  String get usage {

    final exeFile =
        Platform.script.path.split('/').last;

    return
        'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
}

String _removeDash(String input) {

  if (input.startsWith('--')) {
    return input.substring(2);
  }

  if (input.startsWith('-')) {
    return input.substring(1);
  }

  return input;
}
