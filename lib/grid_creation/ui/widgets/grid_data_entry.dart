import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/view_model/grid_creation_viewmodel.dart';

class GridDataEntry extends StatefulWidget {
  int gridLength;

  GridDataEntry(this.gridLength);

  @override
  State<GridDataEntry> createState() => _GridDataEntryState();
}

class _GridDataEntryState extends State<GridDataEntry> {
  GridCreationViewModel model = GridCreationViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Grid Entry Text Field
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                // TextField
                Expanded(
                  child: TextFormField(
                    controller:
                        GridCreationViewModel.gridDataTextEditingController,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        gridEntryError = model.validateGridCreation(
                            value, widget.gridLength);
                      });
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(widget.gridLength),
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ],
                    decoration: InputDecoration(
                        label: Center(
                          child: Text(
                            "Enter ${widget.gridLength} characters",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "${GridCreationViewModel.gridDataTextEditingController.text.length}/${widget.gridLength}",
                  style: TextStyle(
                      color: GridCreationViewModel
                                  .gridDataTextEditingController.text.length >
                              widget.gridLength
                          ? Colors.red
                          : Colors.black),
                ),
              ],
            ),
          ),
        ),
        // Error
        Container(
          child: Text(
            "$gridEntryError",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
