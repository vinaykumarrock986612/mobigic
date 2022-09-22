import 'package:flutter/material.dart';
import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_creation_viewmodel.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/ui/grid_diplay_screen.dart';

class GridCreationNextButton extends StatefulWidget {
  int gridLength;
  int row;
  int column;

  GridCreationNextButton(this.row, this.column, this.gridLength);

  @override
  State<GridCreationNextButton> createState() => _GridCreationNextButtonState();
}

class _GridCreationNextButtonState extends State<GridCreationNextButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Center(
      child: InkWell(
        onTap: () {
          if (GridCreationViewModel.gridDataTextEditingController.text != "" &&
              gridEntryError == "" &&
              widget.gridLength ==
                  GridCreationViewModel
                      .gridDataTextEditingController.text.length) {
            GridGenerate.fill(
              row: widget.row,
              column: widget.column,
              characterList: GridCreationViewModel
                  .gridDataTextEditingController.text
                  .toUpperCase(),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GridDisplayScreen(row: widget.row, column: widget.column),
              ),
            );
          }
        },
        child: Container(
          height: 80,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "NEXT",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
