import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic/grid_creation/view_model/grid_generate.dart';
import 'package:mobigic/grid_display/view_model/grid_display_viewmodel.dart';
import 'package:mobigic/grid_display/view_model/match_functions/diagonal_match_function.dart';
import 'package:mobigic/grid_display/view_model/match_functions/horizontal_match_function.dart';
import 'package:mobigic/grid_display/view_model/match_functions/vertical_match_function.dart';

class GridDisplayScreen extends StatefulWidget {
  int? row;
  int? column;

  GridDisplayScreen({this.row, this.column});

  @override
  State<GridDisplayScreen> createState() => _GridDisplayScreenState();
}

class _GridDisplayScreenState extends State<GridDisplayScreen> {
  GridDisplayViewModel model = GridDisplayViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: IconButton(
              tooltip: "Restart",
              onPressed: () {
                model.resetGridInfo();
                model.navigateToHomePage(context);
              },
              icon: Icon(Icons.refresh, color: Colors.black, size: 35.h),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: GridDisplayViewModel.gridSearchController,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.name,
            onChanged: (value) async {
              setState(() {});
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(5),
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            ],
            decoration: InputDecoration(
                label: Center(
                  child: Text(
                    "Type Max 5 Characters",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                border: InputBorder.none),
          ),
          Center(
            child: ListView.builder(
              itemCount: widget.row,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, rowIndex) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 32.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: widget.column,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, columnIndex) {
                        bool itemExist = model.checkItemExist(
                            item: GridGenerate.grid[rowIndex][columnIndex],
                            rowIndex: rowIndex,
                            columnIndex: columnIndex);
                        bool horizontal = horizontalMatch(
                            rowIndex: rowIndex, columnIndex: columnIndex);
                        bool vertical = verticalMatch(
                            rowIndex: rowIndex, columnIndex: columnIndex);
                        // bool diagonal = diagonalMatch(rowIndex, columnIndex);

                        return Card(
                          child: Container(
                            width: 32.h,
                            alignment: Alignment.center,
                            color: horizontal
                                ? Colors.greenAccent
                                : vertical
                                    ? Colors.greenAccent
                                    : itemExist
                                        ? Colors.orangeAccent
                                        : Colors.white,
                            child: Text(
                              "${GridGenerate.grid[rowIndex][columnIndex]}",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
