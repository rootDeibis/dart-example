import 'dart:io';
import 'dart:typed_data';

Future<ServerSocket> server(String address, int port) async {
  final server = await ServerSocket.bind(address, port);

  server.listen((event) {
    handle_connection(event);
  });

  return server;
}

void handle_connection(Socket socket) {
  socket.listen((event) async {
    final data = await decodeData(event);

    print("Message from ${socket.address} -> ${data}");
  });
}

decodeData(Uint8List data) async {
  await Future.delayed(Duration(seconds: 1));

  final message = String.fromCharCodes(data);

  return message;
}
