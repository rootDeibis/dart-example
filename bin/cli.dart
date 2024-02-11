import 'package:colorize/colorize.dart';

void main(List<String> arguments) {
  final first = arguments.first;

  if (first == "--server") {
    if (arguments.length < 3) {
      final usage_command = Colorize("Usage: --server [address] [port]");

      print(usage_command.red());

      return;
    }
  }
}
