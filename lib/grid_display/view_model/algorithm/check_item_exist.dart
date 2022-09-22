import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';

bool checkItemExist({String? item, int? rowIndex, int? columnIndex}) {
  for (int i = 0;
      i < GridDisplayViewModel.gridSearchController.text.length;
      i++) {
    if (item!.toUpperCase() ==
        GridDisplayViewModel.gridSearchController.text[i].toUpperCase()) {
      return true;
    }
  }
  return false;
}
