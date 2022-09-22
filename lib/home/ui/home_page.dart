import 'package:flutter/material.dart';
import 'package:mobigic/home/ui/widgets/column_textfield.dart';
import 'package:mobigic/home/ui/widgets/next_button.dart';
import 'package:mobigic/home/ui/widgets/row_textfield.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomePageViewModel model = HomePageViewModel();
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row Count TextField
            RowCountTextField(),
            // Column Count TextField
            ColumnCountTextField(),
            // Submit
            NextButton(),
          ],
        ),
      ),
    );
  }
}
