// ignore_for_file: unnecessary_overrides

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickmorty/app/data/storage/get_storage.dart';
import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/widgets/character_card.dart';
import 'package:rickmorty/widgets/snackbar.dart';

class DiscoverController extends GetxController {
  final dio = Dio();

  String nextPage = '';
  var totalItemsfound = 1.obs;
  var isLoading = false.obs;
  var autoFocus = true.obs;
  late Character character;
  RxList<Widget> characterCardListLeft = (List<Widget>.of([])).obs;
  RxList<Widget> characterCardListRight = (List<Widget>.of([])).obs;
  RxList<Widget> characterCardList = (List<Widget>.of([])).obs;

  final scrollController = ScrollController();
  TextEditingController searchInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
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

  void searchCharacter() async {
    characterCardList.clear();
    characterCardListLeft.clear();
    characterCardListRight.clear();

    try {
      isLoading.value = true;
      nextPage =
          'https://rickandmortyapi.com/api/character/?page=1&name=${searchInputController.text}';
      final response = await dio.get(nextPage);

      List<dynamic> characters = response.data['results'];

      for (var i = 0; i < characters.length; i++) {
        if (globalStorage.read('layoutStyle') == 'grid') {
          if (i % 2 == 0) {
            characterCardListLeft.add(
              CharacterCardSmall(
                originPage: 'discover',
                character: Character.fromJson(characters[i]),
              ),
            );
          } else {
            characterCardListRight.add(
              CharacterCardSmall(
                originPage: 'discover',
                character: Character.fromJson(characters[i]),
              ),
            );
          }
        } else {
          characterCardList.add(
            CharacterCardLarge(
              originPage: 'discover',
              character: Character.fromJson(characters[i]),
            ),
          );
        }
      }
      CustomSnackbar.show('Yeay😍', 'Characters loaded successfully!');

      totalItemsfound.value = characterCardList.length +
          characterCardListLeft.length +
          characterCardListRight.length;

      if (totalItemsfound.value == 0) {
        autoFocus.value = true;
      } else {
        autoFocus.value = false;
      }

      if (response.data['info']['next'] != null) {
        nextPage = response.data['info']['next'];
      } else {
        nextPage = '';
      }
      isLoading.value = false;
    } catch (e) {
      totalItemsfound.value = 0;
      CustomSnackbar.show('Oh No😣', 'No items found!');
    }
  }

  void loadMore() async {
    try {
      final response = await dio.get(nextPage);

      List<dynamic> characters = response.data['results'];

      for (var i = 0; i < characters.length; i++) {
        if (globalStorage.read('layoutStyle') == 'grid') {
          if (i % 2 == 0) {
            characterCardListLeft.add(
              CharacterCardSmall(
                originPage: 'discover',
                character: Character.fromJson(characters[i]),
              ),
            );
          } else {
            characterCardListRight.add(
              CharacterCardSmall(
                originPage: 'discover',
                character: Character.fromJson(characters[i]),
              ),
            );
          }
        } else {
          characterCardList.add(
            CharacterCardLarge(
              originPage: 'discover',
              character: Character.fromJson(characters[i]),
            ),
          );
        }
      }

      totalItemsfound.value = characterCardList.length +
          characterCardListLeft.length +
          characterCardListRight.length;

      if (totalItemsfound.value == 0) {
        autoFocus.value = true;
      } else {
        autoFocus.value = false;
      }

      if (response.data['info']['next'] != null) {
        nextPage = response.data['info']['next'];
      }
    } catch (e) {
      totalItemsfound.value = 0;
      CustomSnackbar.show('Oh No😣', 'No items found!');
    }
  }

  void refreshPage() {
    nextPage =
        'https://rickandmortyapi.com/api/character/?page=1&name=${searchInputController.text}';
    characterCardListLeft.clear();
    characterCardListRight.clear();
    searchCharacter();
  }

  void listenEndOfScroll() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels <= 0;
        if (isTop) {
          // refreshPage();
        } else {
          if (nextPage != '') {
            loadMore();
          }
        }
      }
    });
  }
}
