import 'package:get/get.dart';
import 'package:paysense/utils/images.dart';

class ChooseBankController extends GetxController {
  final List<Map<String, dynamic>> chooseBanks = [
    {"bankname": "SadaPay", "bankimg": DummyImg.sadapay},
    {"bankname": "NayaPay", "bankimg": DummyImg.nayapay},
    {"bankname": "United Bank Limited (UBL)", "bankimg": DummyImg.ubl},
    {"bankname": "Bank Al Habib", "bankimg": DummyImg.hbl},
    {"bankname": "PaySense", "bankimg": DummyImg.splashLogo},
  ];
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);
// final List<Map<String, dynamic>> banksknown = ["name":]
  @override
  void onInit() {
    super.onInit();
    foundPlayers.value = chooseBanks;
  }

  @override
  void onClose() {}
  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = chooseBanks;
    } else {
      results = chooseBanks
          .where((element) => element["bankname"]
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }
}
