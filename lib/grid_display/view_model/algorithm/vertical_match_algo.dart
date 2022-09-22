import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/model/vertical_match_model.dart';
import 'package:mobigic/grid_display/view_model/algorithm/check_item_exist.dart';

List<VerticalMatchModel> verticalMatchAlgo() {
  int row = GridGenerate.grid.length;
  int column = GridGenerate.grid[0].length;

  int? verticalMatchIndexStart;
  int? verticalMatchIndexEnd;
  int? verticalMatchLine;

  List<VerticalMatchModel> verticalMatchIndex = [];

  List<String> verticalMatchList = [];
  String word = "";

  for (int columnIndex = 0; columnIndex < column; columnIndex++) {
    int rowIteration = 0;
    for (int rowIndex = 0; rowIndex < row;) {
      word = "";
      rowIteration = rowIndex;
      if (checkItemExist(item: GridGenerate.grid[rowIndex][columnIndex])) {
        word = GridGenerate.grid[rowIndex][columnIndex];
        for (int i = rowIndex + 1; i < row; i++) {
          if (checkItemExist(item: GridGenerate.grid[i][columnIndex])) {
            word = word + GridGenerate.grid[i][columnIndex];

            for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
              String subWord = word.substring(wordIndex);
              if (wordList.contains(subWord.toLowerCase())) {
                verticalMatchList.add(subWord);
                verticalMatchIndexStart = rowIndex + wordIndex;
                verticalMatchIndexEnd = i;
                verticalMatchLine = columnIndex;

                verticalMatchIndex.add(VerticalMatchModel({
                  "verticalMatchIndexStart": verticalMatchIndexStart,
                  "verticalMatchIndexEnd": verticalMatchIndexEnd,
                  "verticalMatchLine": verticalMatchLine,
                }));
              }
            }
          } else {
            rowIndex = i;
            break;
          }
        }
      }
      if (rowIndex == rowIteration) {
        rowIndex++;
      }
    }
  }
  // print(verticalMatchList);
  return verticalMatchIndex;
}
