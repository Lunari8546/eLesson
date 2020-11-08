// Flutter Setup
import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/misc/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

// Widgets Import
import '../widgets/buttons/iconbutton.dart';
import '../widgets/inputs/fieldwithicon.dart';

// Services Import
import 'package:eLesson/services/authservice.dart';

// Models Import
import '../models/functionlist.dart';

// Views Import
import './functions/exampage.dart';
import 'menu/settings.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final searchController = TextEditingController();
  final searchNode = FocusNode();

  @override
  initState() {
    getCurrentTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: mainTheme_red
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "eLesson",
                    style: GoogleFonts.lora(
                      color: Colors.white,
                      fontSize: 40
                    ),
                  ),
                  Text(
                    "DEMO",
                    style: GoogleFonts.titilliumWeb(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Homepage",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 23,
                  color: mainTheme_purple
                )
              ),
              trailing: Icon(
                Icons.home,
                color: mainTheme_purple,
              ),
              onTap: () => {
                Navigator.pop(context)
              },
            ),
            ListTile(
              title: Text(
                "Settings",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 23,
                  color: mainTheme_purple
                )
              ),
              trailing: Icon(
                Icons.settings,
                color: mainTheme_purple
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  AwesomePageRoute(
                    transitionDuration: Duration(milliseconds: 700),
                    exitPage: widget,
                    enterPage: Settings(),
                    transition: StackTransition(curve: Curves.easeInOutCubic)
                  ),
                )
              },
            ),
            Divider(color: mainTheme_purple),
            ListTile(
              title: Text(
                "Sign out",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 23,
                  color: mainTheme_purple
                )
              ),
              trailing: Icon(
                Icons.exit_to_app,
                color: mainTheme_purple
              ),
              onTap: () => {
                context.read<AuthService>().signOut()
              },
            ),
            ListTile(
              title: Text(
                "Close Menu",
                style: GoogleFonts.titilliumWeb(
                  fontSize: 23,
                  color: mainTheme_purple
                )
              ),
              trailing: Icon(
                Icons.close,
                color: mainTheme_purple
              ),
              onTap: () => {
                Navigator.pop(context)
              },
            )
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconBtn(
                  buttonIcon: Icons.menu,
                  buttonFunction: () => {
                    _scaffoldKey.currentState.openDrawer()
                  },
                )
              ],
            ),
            SizedBox(height: 30),
            Text(
              welcomeText,
              style: GoogleFonts.lora(
                color: mainTheme_purple,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            Text(
              quote,
              style: GoogleFonts.titilliumWeb(
                color: mainTheme_purple,
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(50)
              ),
              child: FieldWithIcon(
                buttonText: "Search Users or Articles",
                buttonIcon: Icons.search,
                obscureText: false,
                controller: searchController,
                node: searchNode,
                onEditingComplete: () => searchNode.unfocus(),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Study & Learn",
                  style: GoogleFonts.titilliumWeb(
                    color: mainTheme_purple,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: StaggeredGridView.countBuilder(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                itemCount: functions.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => {
                      if (functions[index].name == "Exam") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExamPage())
                        )
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: index.isEven ? 200 : 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(functions[index].image),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            functions[index].name,
                            style: GoogleFonts.lora(
                              color: Colors.white
                            )
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)
              )
            )
          ],
        ),
      ),
    );
  }
}