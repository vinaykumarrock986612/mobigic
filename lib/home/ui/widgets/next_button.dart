import 'package:flutter/material.dart';
import 'package:mobigic/global_variables.dart';
import 'package:mobigic/grid_creation/ui/grid_creation_screen.dart';
import 'package:mobigic/home/view_model/home_page_viewmodel.dart';

class NextButton extends StatefulWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          if (HomePageViewModel.rowCountController.text != "" &&
              HomePageViewModel.columnCountController.text != "" &&
              rowCountError == "" &&
              columnCountError == "") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GridCreationScreen(
                  int.parse(HomePageViewModel.rowCountController.text),
                  int.parse(HomePageViewModel.columnCountController.text),
                ),
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
