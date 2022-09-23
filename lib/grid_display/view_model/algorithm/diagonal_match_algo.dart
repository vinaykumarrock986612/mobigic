import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/view_model/algorithm/check_item_exist.dart';

List<List<bool>> diagonalMatchAlgo() {
  int row = GridGenerate.grid.length;
  int column = GridGenerate.grid[0].length;
  var data = GridGenerate.grid;
  // var tempDiagonalBoolData = GridGenerate.gridDiagonalBool;
  var finalDiagonalBoolData = GridGenerate.gridDiagonalBool;


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

        if (rowIndex < row - 1 && columnIteration < column - 1) {
          int j = rowIndex + 1;
          for (int i = columnIteration + 1; i < column; i++) {
            if (checkItemExist(item: data[j][i])) {
              word = word + data[j][i];

              for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
                String subWord = word.substring(wordIndex);
                if (wordList.contains(subWord.toLowerCase())) {

                  for(int r_iteration = rowIndex+wordIndex; r_iteration <= j;){
                    for(int c_iteration = columnIteration+wordIndex; c_iteration <= i; c_iteration++){
                      finalDiagonalBoolData[r_iteration][c_iteration] = true;
                      r_iteration++;
                    }
                  }

                  diagonalMatchList.add(subWord);
                }
              }
            } else {
              // tempDiagonalBoolData = finalDiagonalBoolData;
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


        if (rowIteration < row - 1 &&
            columnIteration < column - 1 &&
            rowIndex < row - 1) {
          int j = rowIteration + 1;

          for (int i = columnIteration + 1; i < column; i++) {
            if (checkItemExist(item: data[j][i])) {

              word = word + data[j][i];
              for (int wordIndex = 0; wordIndex < word.length; wordIndex++) {
                String subWord = word.substring(wordIndex);
                if (wordList.contains(subWord.toLowerCase())) {

                  for(int r_iteration = rowIteration+wordIndex; r_iteration <= j;){
                    for(int c_iteration = columnIteration+wordIndex; c_iteration <= i; c_iteration++){
                      finalDiagonalBoolData[r_iteration][c_iteration] = true;
                      r_iteration++;
                    }
                  }

                  diagonalMatchList.add(subWord);
                }
              }
            } else {
              // tempDiagonalBoolData = finalDiagonalBoolData;
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