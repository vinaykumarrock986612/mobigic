import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic/global_variables.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

class ColumnCountTextField extends StatefulWidget {
  const ColumnCountTextField({Key? key}) : super(key: key);

  @override
  State<ColumnCountTextField> createState() => _ColumnCountTextFieldState();
}

class _ColumnCountTextFieldState extends State<ColumnCountTextField> {
  HomePageViewModel model = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
              controller: HomePageViewModel.columnCountController,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  columnCountError = model.validateRowColumn(value);
                });
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  label: Center(
                    child: Text(
                      "Column Count",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
        // Column Count Error
        Container(
          child: Text(
            "$columnCountError",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
