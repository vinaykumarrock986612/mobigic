import 'package:mobigic/grid_display/model/horizontal_match_model.dart';
import 'package:mobigic/grid_display/view_model/algorithm/horizontal_match_algo.dart';
import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';

bool horizontalMatch({int? rowIndex, int? columnIndex}) {
  List<HorizontalMatchModel> horizontalMatchList = horizontalMatchAlgo();
  if (GridDisplayViewModel.gridSearchController.text != "") {
    if (horizontalMatchList != null) {
      for (int i = 0; i < horizontalMatchList.length; i++) {
        if (horizontalMatchList
                .elementAt(i)
                .matchPosition["horizontalMatchLine"] ==
            rowIndex) {
          int? start = horizontalMatchList
              .elementAt(i)
              .matchPosition["horizontalMatchIndexStart"];
          int? end = horizontalMatchList
              .elementAt(i)
              .matchPosition["horizontalMatchIndexEnd"];
          if (start != null && end != null) {
            if (columnIndex! >= start && columnIndex <= end) {
              return true;
            }
          }
        }
      }
    }
  }
  return false;
}
