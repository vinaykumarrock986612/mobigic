import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/view_model/algorithm/diagonal_match_algo.dart';
import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';

bool diagonalMatch(int rowIndex, int columnIndex) {
  List<List<bool>> diagonalBoolList =
      diagonalMatchAlgo(GridGenerate.gridDiagonalBool);
  if (GridDisplayViewModel.gridSearchController.text != "") {
    if (diagonalBoolList != null) {
      return diagonalBoolList[rowIndex][columnIndex];
    }
  }
  return false;
}
