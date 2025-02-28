import 'package:julelotteri_app/services/lotteri_service.dart';

class LotteriController {
  LotteriController._(); // Private constructor

  static final LotteriController instance = LotteriController._();

  Future<void> onPlayPressed() async {
    final response = await LotteriService.instance.getWinner();
    print(response);
  }
}
