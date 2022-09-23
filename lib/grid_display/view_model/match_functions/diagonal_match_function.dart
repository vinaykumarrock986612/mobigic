import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/view_model/algorithm/diagonal_match_algo.dart';
import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

bool diagonalMatch(int rowIndex, int columnIndex) {
  // flushBoolData();
  print(GridGenerate.gridDiagonalBool);
  List<List<bool>> diagonalBoolList =
      diagonalMatchAlgo(GridGenerate.gridDiagonalBool);
  print("New data: ${diagonalBoolList}");
  if (GridDisplayViewModel.gridSearchController.text != "") {
    if (diagonalBoolList != null) {
      return diagonalBoolList[rowIndex][columnIndex];
    }
  }
  return false;
}

// void flushBoolData() {
//   int row = int.parse(HomePageViewModel.rowCountController.text);
//   int column = int.parse(HomePageViewModel.columnCountController.text);
//   for (int i = 0; i < row; i++) {
//     List<bool> rowDataBool = []; // Temporary variable to store row data
//     for (int j = 0; j < column; j++) {
//       rowDataBool.add(false);
//     }
//
//     GridGenerate.gridDiagonalBool.add(rowDataBool);
//   }
// }
