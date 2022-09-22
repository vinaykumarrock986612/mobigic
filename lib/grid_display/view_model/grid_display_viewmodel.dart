import 'package:flutter/material.dart';
import 'package:mobigic/grid_creation/view_model/grid_creation_viewmodel.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/home/ui/home_page.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

class GridDisplayViewModel {
  static TextEditingController gridSearchController = TextEditingController();

  bool checkItemExist({String? item, int? rowIndex, int? columnIndex}) {
    for (int i = 0; i < gridSearchController.text.length; i++) {
      if (item!.toUpperCase() == gridSearchController.text[i].toUpperCase()) {
        return true;
      }
    }
    return false;
  }

  void resetGridInfo() {
    gridSearchController = TextEditingController();
    GridCreationViewModel.gridDataTextEditingController =
        TextEditingController();
    HomePageViewModel.rowCountController = TextEditingController();
    HomePageViewModel.columnCountController = TextEditingController();
    GridGenerate.grid = [];
    GridGenerate.gridDiagonalBool = [];
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false);
  }
}
