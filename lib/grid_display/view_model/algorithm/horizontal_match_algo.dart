import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/model/horizontal_match_model.dart';
import 'package:mobigic/grid_display/view_model/algorithm/check_item_exist.dart';


List<HorizontalMatchModel> horizontalMatchAlgo() {
  int row = GridGenerate.grid.length;
  int column = GridGenerate.grid[0].length;

  int? horizontalMatchIndexStart;
  int? horizontalMatchIndexEnd;
  int? horizontalMatchLine;

  List<HorizontalMatchModel> horizontalMatchList = [];

  List<String> horizontalMatchWordList = [];
  String word = "";

  for (int rowIndex = 0; rowIndex < row; rowIndex++) {
    int columnIteration = 0;
    for (int columnIndex = 0; columnIndex < column;) {
      word = "";
      columnIteration = columnIndex;
      if (checkItemExist(item: GridGenerate.grid[rowIndex][columnIndex])) {
        word = GridGenerate.grid[rowIndex][columnIndex];
        for (int i = columnIndex + 1; i < column; i++) {
          if (checkItemExist(item: GridGenerate.grid[rowIndex][i])) {
            word = word + GridGenerate.grid[rowIndex][i];
            for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
              String subWord = word.substring(wordIndex);
              if (wordList.contains(subWord.toLowerCase())) {
                horizontalMatchWordList.add(subWord);
                horizontalMatchIndexStart = columnIndex + wordIndex;
                horizontalMatchIndexEnd = i;
                horizontalMatchLine = rowIndex;

                horizontalMatchList.add(HorizontalMatchModel({
                  "horizontalMatchIndexStart": horizontalMatchIndexStart,
                  "horizontalMatchIndexEnd": horizontalMatchIndexEnd,
                  "horizontalMatchLine": horizontalMatchLine,
                }));
              }
            }
          } else {
            columnIndex = i;
            break;
          }
        }
      }
      if (columnIndex == columnIteration) {
        columnIndex++;
      }
    }
  }
  // print(horizontalMatchWordList);
  return horizontalMatchList;
}
