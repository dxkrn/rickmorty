// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/widgets/character_card.dart';
import 'package:rickmorty/widgets/snackbar.dart';

class HomeController extends GetxController {
  String nextPage = 'https://rickandmortyapi.com/api/character/?page=1';
  late Character character;
  RxList<Widget> characterCardListLeft = (List<Widget>.of([])).obs;
  RxList<Widget> characterCardListRight = (List<Widget>.of([])).obs;
  RxList<Widget> characterCardList = (List<Widget>.of([])).obs;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getCharacter();
    listenEndOfScroll();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final dio = Dio();

  void getCharacter() async {
    try {
      final response = await dio.get(nextPage);
      List<dynamic> characters = response.data['results'];

      for (var i = 0; i < characters.length; i++) {
        if (globalStorage.read('layoutStyle') == 'grid') {
          if (i % 2 == 0) {
            characterCardListLeft.add(
              CharacterCardSmall(
                originPage: 'home',
                character: Character.fromJson(characters[i]),
              ),
            );
          } else {
            characterCardListRight.add(
              CharacterCardSmall(
                originPage: 'home',
                character: Character.fromJson(characters[i]),
              ),
            );
          }
        } else {
          characterCardList.add(
            CharacterCardLarge(
              originPage: 'home',
              character: Character.fromJson(characters[i]),
            ),
          );
        }
      }
      // CustomSnackbar.show('Yeay😍', 'Characters loaded successfully!');

      nextPage = response.data['info']['next'];
    } catch (e) {
      CustomSnackbar.show('Oh No😣', e.toString());
    }
  }

  void refreshPage() {
    nextPage = 'https://rickandmortyapi.com/api/character/?page=1';
    characterCardListLeft.clear();
    characterCardListRight.clear();
    getCharacter();
  }

  void listenEndOfScroll() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels <= 0;
        if (isTop) {
          refreshPage();
        } else {
          getCharacter();
        }
      }
    });
  }
}
