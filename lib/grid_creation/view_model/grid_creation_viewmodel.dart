import 'dart:math';

import 'package:flutter/material.dart';

class GridCreationViewModel {
  static TextEditingController gridDataTextEditingController =
  TextEditingController();

  String validateGridCreation(String? value, int? length) {
    String pattern = r"[A-Za-z]+$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Enter Alphabets only without space';
    } else if (gridDataTextEditingController.text.length > length!) {
      return "Character length exceed";
    } else {
      return "";
    }
  }

  void generateRandomString(int? length) {
    String alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Random random = Random();

    GridCreationViewModel.gridDataTextEditingController.text = String.fromCharCodes(
      Iterable.generate(
        length!,
            (_) => alphabets.codeUnitAt(
          random.nextInt(alphabets.length),
        ),
      ),
    );
    GridCreationViewModel.gridDataTextEditingController.selection =
        TextSelection.fromPosition(
          TextPosition(
            offset: GridCreationViewModel.gridDataTextEditingController.text.length,
          ),
        );
  }
}


