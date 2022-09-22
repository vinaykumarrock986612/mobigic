class GridGenerate {
  int? row;
  int? column;
  String? characterList;
  static List<List<String>> grid = [];
  static List<List<bool>> gridDiagonalBool = [];

  GridGenerate.fill({this.row, this.column, this.characterList}) {
    int currentIndex = 0;
    for (int i = 0; i < row!; i++) {
      List<String> rowData = []; // Temporary variable to store row data
      List<bool> rowDataBool = []; // Temporary variable to store row data

      for (int j = 0; j < column!; j++) {
        rowData.add(characterList![currentIndex]);
        rowDataBool.add(false);
        currentIndex++;
      }
      grid.add(rowData);
      gridDiagonalBool.add(rowDataBool);
    }
  }
}