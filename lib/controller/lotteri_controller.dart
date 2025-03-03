import 'package:file_picker/file_picker.dart';
import 'package:julelotteri_frontend/generated/julelotteri.pb.dart';
import 'package:julelotteri_frontend/services/lotteri_service.dart';
import 'package:flutter/foundation.dart';

class LotteriController {
  LotteriController._(); // Private constructor

  static final LotteriController instance = LotteriController._();

  // A ValueNotifier that holds the current list of player numbers.
  final ValueNotifier<List<int>> players = ValueNotifier<List<int>>([]);

  Future<void> onPlayPressed() async {
    final response = await LotteriService.instance.getWinner();
    print(response);
    // Optionally, reload players after a winner is selected.
    await loadPlayers();
  }

  Future<void> loadPlayers() async {
    try {
      // getPlayers() returns a Future<List<Player>>
      List<Player> fetchedPlayers = await LotteriService.instance.getPlayers();
      print("Fetched players: ${fetchedPlayers.length}");
      // Update the players notifier with the numbers of players.
      players.value = fetchedPlayers.map((p) => p.id).toList();
    } catch (e) {
      print("Error loading players: $e");
    }
  }

  Future<void> initFilePicker() async {
    // Open file picker for Excel files
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        bool success = await LotteriService.instance.importExcelFile(filePath);
        // If successfully imported new players, reload the players list.
        if (success) {
          await loadPlayers();
        }
      }
    } else {
      // User canceled the picker.
      print("No file selected.");
    }
  }
}
