import 'package:grpc/grpc.dart';
import 'package:julelotteri_app/generated/google/protobuf/empty.pb.dart';
import 'package:julelotteri_app/generated/julelotteri.pbgrpc.dart';

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
      print('gRPC call failed: $e');
      return null;
    }
  }
}
