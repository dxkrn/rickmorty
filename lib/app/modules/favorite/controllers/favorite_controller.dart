// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickmorty/app/data/database/database_manager.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/widgets/character_card.dart';

class FavoriteController extends GetxController {
  RxList<Widget> characterCardList = <Widget>[].obs;
  RxList<Widget> characterCardListLeft = <Widget>[].obs;
  RxList<Widget> characterCardListRight = <Widget>[].obs;
  var isLoading = true.obs;
  var totalFav = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getFavorite();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getFavorite() async {
    List<Character> characters = [];

    DatabaseManager database = DatabaseManager();
    characters = await database.getCharacters();
    for (var i = 0; i < characters.length; i++) {
      if (globalStorage.read('layoutStyle') == 'grid') {
        if (i % 2 == 0) {
          characterCardListLeft.add(
            CharacterCardSmall(
              originPage: 'favorite',
              character: characters[i],
            ),
          );
        } else {
          characterCardListRight.add(
            CharacterCardSmall(
              originPage: 'favorite',
              character: characters[i],
            ),
          );
        }
      } else {
        characterCardList.add(
          CharacterCardLarge(
            originPage: 'favorite',
            character: characters[i],
          ),
        );
      }
    }

    totalFav.value = characterCardList.length +
        characterCardListLeft.length +
        characterCardListRight.length;

    isLoading.value = false;
  }
}
