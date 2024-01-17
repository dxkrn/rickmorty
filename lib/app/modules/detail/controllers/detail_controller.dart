// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:rickmorty/app/models/character_model.dart';

class DetailController extends GetxController {
  late Character character;

  @override
  void onInit() {
    super.onInit();
    getCharacterDetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCharacterDetail() {
    var data = Get.arguments;
    character = Character.fromJson(data['character']);
  }
}
