import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobigic/global_variables.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

class RowCountTextField extends StatefulWidget {
  const RowCountTextField({Key? key}) : super(key: key);

  @override
  State<RowCountTextField> createState() => _RowCountTextFieldState();
}

class _RowCountTextFieldState extends State<RowCountTextField> {

  HomePageViewModel model = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: TextFormField(
            controller: HomePageViewModel.rowCountController,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                rowCountError = model.validateRowColumn(value);
              });
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                label: Center(
                  child: Text(
                    "Row Count",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
                border: InputBorder.none),
          ),
        ),
        Container(
          child: Text(
            "$rowCountError",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
