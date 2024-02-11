import 'package:colorize/colorize.dart';
import 'package:cli/socket/server.dart' as socket;

void main(List<String> arguments) async {
  final first = arguments.first;

  if (first == "--server") {
    if (arguments.length < 3) {
      final usage_command = Colorize("Usage: --server [address] [port]");

      print(usage_command.red());

      return;
    } else {
      final address = arguments[1];
      final port = int.tryParse(arguments[2]);

      if (port != null) {
        await socket.server(address, port);

        print(Colorize("Running socket server in ${address}:${port}").green());
      }
    }
  }
}
