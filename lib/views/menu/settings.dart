// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import '../../misc/variables.dart';
import 'package:google_fonts/google_fonts.dart';

// Widgets Import
import '../../widgets/buttons/iconbutton.dart';
import '../../widgets/buttons/listbutton.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconBtn(
                  buttonIcon: Icons.arrow_back,
                  buttonFunction: () => {
                    Navigator.pop(context)
                  }
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/campfire.jpg"),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: mainTheme_purple,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () => {

                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (!darkMode)
                IconBtn(
                  buttonIcon: Icons.nights_stay,
                  buttonFunction: () => {
                    darkMode = true,

                    setState(() {})
                  }
                ),
                if (darkMode)
                IconBtn(
                  buttonIcon: Icons.brightness_7,
                  buttonFunction: () => {
                    darkMode = false,

                    setState(() {})
                  }
                )
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Lunari8546",
              style: GoogleFonts.lora(
                color: mainTheme_purple,
                fontSize: 22,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 5),
            Text(
              "www.voltgaming@gmail.com",
              style: GoogleFonts.titilliumWeb(
                color: mainTheme_purple,
                fontSize: 16,
                fontWeight: FontWeight.w300
              )
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  ProfileListItem(
                    icon: Icons.info,
                    settingText: "Show Legalese",
                    function: () => {
                      showAboutDialog(context: context)
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}