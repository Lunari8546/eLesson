import 'package:flutter/material.dart';
import 'package:eLesson/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class Options extends StatelessWidget {
  Options(this.item1);

  Option item1 = new Option();

  @override
  Widget build(BuildContext context) {
    List<Option> optionList = [item1];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: optionList.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(height: 40);
            } else if (index == optionList.length + 1) {
              return SizedBox(height: 100);
            }
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)
              ),
              child: GestureDetector(
                onTap: optionList[index - 1].function,
                  child: ListTile(
                    leading: optionList[index - 1].icon,
                    title: Text(
                      optionList[index - 1].title,
                      style: GoogleFonts.montserrat(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
  }
}

class Option {
  Icon icon;
  String title;
  Function function;
  Option({this.icon, this.title, this.function});
}