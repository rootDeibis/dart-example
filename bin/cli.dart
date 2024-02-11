import 'package:cli/cli.dart';
import 'dart:io';
import 'dart:convert';

late ServerSocket server;

Stream<String> readLine() =>
    stdin.transform(utf8.decoder).transform(const LineSplitter());

final List<String> commands = ["help", "start", "stop", "info", "clear"];

void main(List<String> arguments) async {
  printMain();

  readLine().listen(processLine);

  printShell();
}

void processLine(String data) {
  var command = data.split(" ");

  if (command.length == 0) {
    print("Uknown command, try another.");
  } else {
    if (commands.contains(command[0])) {
      if (command[0] == 'help') {
        print(commands);
      } else if (command[0] == 'clear') {
        for (var i = 0; i < 200; i++) {
          print("");
        }
        printMain();
      }
    } else {
      print("Uknown command, try another or use 'help'");
    }
  }

  printShell();
}
