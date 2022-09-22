import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/view_model/algorithm/check_item_exist.dart';

List<List<bool>> diagonalMatchAlgo() {
  int row = GridGenerate.grid.length;
  int column = GridGenerate.grid[0].length;
  var data = GridGenerate.grid;
  var tempDiagonalBoolData = GridGenerate.gridDiagonalBool;
  var finalDiagonalBoolData = GridGenerate.gridDiagonalBool;
  var defaultDiagonalBoolData = GridGenerate.gridDiagonalBool;

  List<Map<String, int>> diagonalMatchIndex = [];
  List<String> diagonalMatchList = [];

  String word = "";

  for (int columnIndex = column - 2; columnIndex >= 0; columnIndex--) {
    int columnIteration = columnIndex;

    for (int rowIndex = 0; rowIndex < column; rowIndex++) {
      if (columnIteration >= column || rowIndex >= row) {
        break;
      }
      if (checkItemExist(item: data[rowIndex][columnIteration])) {
        word = data[rowIndex][columnIteration];
        tempDiagonalBoolData[rowIndex][columnIteration] = true;
        if (rowIndex < row - 1 && columnIteration < column - 1) {
          int j = rowIndex + 1;
          for (int i = columnIteration + 1; i < column; i++) {
            if (checkItemExist(item: data[j][i])) {
              word = word + data[j][i];
              tempDiagonalBoolData[j][i] = true;
              for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
                String subWord = word.substring(wordIndex);
                if (wordList.contains(subWord.toLowerCase())) {
                  for (int boolUpdateRow = j;
                  boolUpdateRow < wordIndex;
                  boolUpdateRow++) {
                    for (int boolUpdateColumn = i;
                    boolUpdateColumn < wordIndex;
                    boolUpdateColumn++) {
                      tempDiagonalBoolData[rowIndex][columnIteration] = false;
                      print(
                          "This is the number of times the loop is running");
                    }
                    print("This loop is running");
                  }
                  finalDiagonalBoolData = tempDiagonalBoolData;
                  diagonalMatchList.add(subWord);
                }
              }
            } else {
              tempDiagonalBoolData = finalDiagonalBoolData;
            }
            j++;
          }
        }
      }
      columnIteration++;
    }
  }

  for (int rowIndex = 0; rowIndex < row - 1; rowIndex++) {
    int rowIteration = rowIndex;
    for (int columnIteration = 0;
    columnIteration < column;
    columnIteration++) {
      if (columnIteration >= column || rowIteration >= row) {
        break;
      }

      if (checkItemExist(item: data[rowIteration][columnIteration])) {
        word = data[rowIteration][columnIteration];
        tempDiagonalBoolData[rowIteration][columnIteration] = true;

        if (rowIteration < row - 1 &&
            columnIteration < column - 1 &&
            rowIndex < row - 1) {
          int j = rowIteration + 1;

          for (int i = columnIteration + 1; i < column; i++) {
            if (checkItemExist(item: data[j][i])) {
              tempDiagonalBoolData[j][i] = true;
              word = word + data[j][i];
              for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
                String subWord = word.substring(wordIndex);
                if (wordList.contains(subWord.toLowerCase())) {
                  for (int boolUpdateRow = j;
                  boolUpdateRow < wordIndex;
                  boolUpdateRow++) {
                    for (int boolUpdateColumn = i;
                    boolUpdateColumn < wordIndex;
                    boolUpdateColumn++) {
                      tempDiagonalBoolData[rowIndex][columnIteration] = false;
                    }
                  }
                  finalDiagonalBoolData = tempDiagonalBoolData;

                  diagonalMatchList.add(subWord);
                }
              }
            } else {
              tempDiagonalBoolData = finalDiagonalBoolData;
            }
            j++;
            if (i >= column || j >= row) {
              break;
            }
          }
        }
      }
      rowIteration++;
    }
  }
  print(diagonalMatchList);
  return finalDiagonalBoolData;
}