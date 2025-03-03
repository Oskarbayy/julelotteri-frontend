import 'dart:developer';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:julelotteri_frontend/generated/google/protobuf/empty.pb.dart';
import 'package:julelotteri_frontend/generated/julelotteri.pbgrpc.dart';

class LotteriService {
  // Attributtes that the service has
  late ClientChannel channel;
  late LotteriServiceClient stub;

  // private Constructor? Sets up the connection
  LotteriService._() {
    channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(), // secure | insecure?
      ),
    );

    stub = LotteriServiceClient(channel);
  }

  static final LotteriService instance = LotteriService._();

// Methods
  Future<Player?> getWinner() async {
    try {
      // Call the gRPC method, sending an empty message.
      final response = await stub.getWinner(Empty());
      return response;
    } catch (e) {
      log('gRPC call failed: $e');
      return null;
    }
  }

  Future<bool> importExcelFile(String filePath) async {
    try {
      // Read the file data as bytes
      final file = File(filePath);
      final fileBytes = await file.readAsBytes();

      // Create the request with file data
      final request = ImportExcelFileRequest(fileData: fileBytes);

      // Call the gRPC method
      final response = await stub.importExcelFile(request);
      return response.success;
    } catch (e) {
      log('gRPC call failed: $e');
      return false;
    }
  }

  Future<List<Player>> getPlayers() async {
    try {
      // Call the gRPC method by passing an empty message.
      final response = await stub.getPlayers(Empty());
      // The response is of type PlayerList, which contains a list of players.
      return response.players;
    } catch (e) {
      log('gRPC call failed: $e');
      return [];
    }
  }
}
