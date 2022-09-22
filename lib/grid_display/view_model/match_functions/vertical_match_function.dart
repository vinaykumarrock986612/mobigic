import 'package:mobigic/grid_display/model/vertical_match_model.dart';
import 'package:mobigic/grid_display/view_model/algorithm/vertical_match_algo.dart';
import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';

bool verticalMatch({int? rowIndex, int? columnIndex}) {
  List<VerticalMatchModel> verticalMatchList = verticalMatchAlgo();
  if (GridDisplayViewModel.gridSearchController.text != "") {
    if (verticalMatchList != null) {
      for (int i = 0; i < verticalMatchList.length; i++) {
        if (verticalMatchList
                .elementAt(i)
                .verticalMatchModel["verticalMatchLine"] ==
            columnIndex) {
          int? start = verticalMatchList
              .elementAt(i)
              .verticalMatchModel["verticalMatchIndexStart"];
          int? end = verticalMatchList
              .elementAt(i)
              .verticalMatchModel["verticalMatchIndexEnd"];
          if (start != null && end != null) {
            if (rowIndex! >= start && rowIndex <= end) {
              return true;
            }
          }
        }
      }
    }
  }
  return false;
}
