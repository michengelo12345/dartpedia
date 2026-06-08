import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'arguments.dart';
import 'exceptions.dart';

class CommandRunner {
  CommandRunner({
    this.onOutput,
    this.onError,
  });

  FutureOr<void> Function(
    String,
  )? onOutput;

  FutureOr<void> Function(
    Object,
  )? onError;

  final Map<String, Command>
      _commands =
      <String, Command>{};

  UnmodifiableSetView<Command>
      get commands =>
          UnmodifiableSetView<
              Command>(
            <Command>{
              ..._commands.values,
            },
          );

  Future<void> run(
    List<String> input,
  ) async {
    try {
      final ArgResults results =
          parse(input);

      if (results.command != null) {
        Object? output =
            await results.command!
                .run(results);

        if (onOutput != null) {
          await onOutput!(
            output.toString(),
          );
        } else {
          print(
            output.toString(),
          );
        }
      }
    } on Exception catch (
      exception,
    ) {
      if (onError != null) {
        onError!(exception);
      } else {
        rethrow;
      }
    }
  }

  void addCommand(
    Command command,
  ) {
    _commands[command.name] =
        command;

    command.runner = this;
  }

  ArgResults parse(
    List<String> input,
  ) {
    // mantém exatamente o parse
    // que você implementou
    // no capítulo anterior
    // (não altere essa parte)
    throw UnimplementedError();
  }

  String get usage {
    final exeFile =
        Platform.script.path
            .split('/')
            .last;

    return 'Usage: dart bin/$exeFile <command> [commandArg?] [...options?]';
  }
}
