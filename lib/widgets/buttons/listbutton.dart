// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import '../../misc/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String settingText;
  final Function function;

  const ProfileListItem({
    Key key,
    this.icon,
    this.settingText,
    this.function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.function,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(
          horizontal: 20
        ).copyWith(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: mainTheme_purple,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Row(
          children: <Widget>[
            Icon(
              this.icon,
              size: 32,
              color: Colors.white,
            ),
            SizedBox(width: 25),
            Text(
              this.settingText,
              style: GoogleFonts.titilliumWeb(
                color: Colors.white,
                fontSize: 22
              ),
            )
          ],
        )
      ),
    );
  }
}