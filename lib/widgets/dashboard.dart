import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  DashboardItem item1 = new DashboardItem(
    title: "Assignment",
    event: "0",
    icon: Icon(Icons.assignment),
    function: () => {
      
    }
  );

  DashboardItem item2 = new DashboardItem(
    title: "Profile",
    event: "",
    icon: Icon(Icons.account_circle),
    function: () => {
      
    }
  );

  DashboardItem item3 = new DashboardItem(
    title: "Settings",
    event: "",
    icon: Icon(Icons.settings),
    function: () => {
      
    }
  );

  @override
  Widget build(BuildContext context) {
    List<DashboardItem> dashboardList = [item1, item2, item3];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.symmetric(horizontal: 30),
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        children: dashboardList.map((data) {
          return GestureDetector(
            onTap: data.function,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(data.icon.icon),
                  SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    data.event,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList()
      ),
    );
  }
}

class DashboardItem {
  String title;
  String event;
  Icon icon;
  Function function;
  DashboardItem({this.title, this.event, this.icon, this.function});
}