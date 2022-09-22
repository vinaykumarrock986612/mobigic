import 'package:flutter/material.dart';
import 'package:mobigic/grid_creation/ui/widgets/auto_fill_button.dart';
import 'package:mobigic/grid_creation/ui/widgets/grid_data_entry.dart';
import 'package:mobigic/grid_creation/ui/widgets/next_button.dart';


class GridCreationScreen extends StatefulWidget {
  int? gridLength;
  int row;
  int column;

  GridCreationScreen(this.row, this.column) {
    gridLength = row * column;
  }

  @override
  State<GridCreationScreen> createState() => _GridCreationScreenState();
}

class _GridCreationScreenState extends State<GridCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Grid Data TextField
            GridDataEntry(widget.gridLength!),
            // AutoFill
            AutoFillButton(widget.gridLength!),
            // Divider
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Divider(thickness: 2),
              ),
            ),
            // Submit
            GridCreationNextButton(
                widget.row, widget.column, widget.gridLength!),
          ],
        ),
      ),
    );
  }
}
