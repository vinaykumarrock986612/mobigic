import 'package:flutter/material.dart';
import 'package:mobigic/grid_creation/view_model/grid_creation_viewmodel.dart';

class AutoFillButton extends StatefulWidget {
  int gridLength;
  AutoFillButton(this.gridLength);

  @override
  State<AutoFillButton> createState() => _AutoFillButtonState();
}

class _AutoFillButtonState extends State<AutoFillButton> {
  GridCreationViewModel model = GridCreationViewModel();
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: InkWell(
        onTap: () {
          setState(() {
            model.generateRandomString(widget.gridLength);
          });
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            "AUTO FILL",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
