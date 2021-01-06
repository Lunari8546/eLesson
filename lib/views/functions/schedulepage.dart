// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/misc/variables.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

// Widgets Import
import '../../widgets/buttons/iconbutton.dart';
import '../../widgets/buttons/listbutton.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _calendarMode = false;

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
                IconBtn(
                  buttonIcon: Icons.add,
                  buttonFunction: () => {
                    showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        insetPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 90),
                        title: new Text("Add new..."),
                        content: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ProfileListItem(
                              icon: Icons.label,
                              settingText: "Task",
                              function: () => {
                                Navigator.of(context).pop()
                              }
                            ),
                            SizedBox(height: 20),
                            ProfileListItem(
                              icon: Icons.list,
                              settingText: "List",
                              function: () => {
                                Navigator.of(context).pop()
                              }
                            ),
                            SizedBox(height: 20),
                            ProfileListItem(
                              icon: Icons.notes,
                              settingText: "Note",
                              function: () => {
                                Navigator.of(context).pop()
                              }
                            )
                          ],
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    )
                  }
                ),
                if (!_calendarMode)
                IconBtn(
                  buttonIcon: Icons.today,
                  buttonFunction: () => {
                    _calendarMode = true,

                    setState(() {})
                  }
                ),
                if (_calendarMode)
                IconBtn(
                  buttonIcon: Icons.date_range,
                  buttonFunction: () => {
                    _calendarMode = false,

                    setState(() {})
                  }
                )
              ],
            ),
            if (!_calendarMode)
            Today(),
            if (_calendarMode)
            Month()
          ],
        ),
      ),
    );
  }
}

class Month extends StatefulWidget {
  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
  CalendarController ctrlr = new CalendarController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          SizedBox(height: 25),
          TableCalendar(
            calendarController: ctrlr,
            startingDayOfWeek: StartingDayOfWeek.monday,
            initialCalendarFormat: CalendarFormat.week
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Today",
                          style: GoogleFonts.lora(
                            fontSize: 20
                          )
                        )
                      ],
                    ),
                  ),
                  taskWidget(
                    mainTheme_purple,
                    "School",
                    "8:15 AM"
                  ),
                  taskWidget(
                    mainTheme_purple,
                    "Work on The Big Mug",
                    "10:00 AM"
                  ),
                  taskWidget(
                    mainTheme_purple,
                    "Develop eLesson",
                    "14:00 PM"
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget> [
          SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Today",
                            style: GoogleFonts.lora(
                              fontSize: 20
                            )
                          )
                        ],
                      ),
                    ),
                    taskWidget(
                      mainTheme_purple,
                      "School",
                      "8:15 AM"
                    ),
                    taskWidget(
                      mainTheme_purple,
                      "Work on The Big Mug",
                      "10:00 AM"
                    ),
                    taskWidget(
                      mainTheme_purple,
                      "Develop eLesson",
                      "14:00 PM"
                    )
                  ],
                ),
            ),
          )
        ]
      ),
    );
  }
}

Slidable taskWidget(Color color, String title, String time) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.3,
    child: Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0,9),
            blurRadius: 20,
            spreadRadius: 1
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 4
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title, 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
              Text(
                time, 
                style: TextStyle(
                  color: mainTheme_purple,
                  fontSize: 18
                ),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            height: 50,
            width: 5,
            color: color,
          )
        ],
      ),
    ),
    secondaryActions: [
      IconSlideAction(
        caption: "Edit",
        color: Colors.white,
        icon: Icons.edit,
        onTap: () => {

        },
      ),
      IconSlideAction(
        caption: "Delete",
        color: color,
        icon: Icons.delete,
        onTap: () => {
          
        },
      )
    ],
  );
}