import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});
  @override
  _InfoPageState createState() => _InfoPageState();
}
class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 204, 204),
      drawer: Drawer(child: listview()),
      appBar: AppBar(
          toolbarHeight:61,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(219, 17, 142, 125),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5),
            Expanded(
              child: Text(
                "Wings Of Wonder The Foundation",
                style: TextStyle(fontSize: 19, color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 9),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Notifications",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.circle_notifications_sharp,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.settings, color: Colors.white),
            )  ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:0.32),
            listContainer(),
            SizedBox(height: 5,),
            Text("Student Information",style: TextStyle(color: Color.fromARGB(219, 17, 142, 125 ),fontSize:17.6,fontWeight: FontWeight.bold ),),
            studentGrid(),
          ],
        ),
      ),
    );
  }













Widget listview() {
  return ListView(
    padding: EdgeInsets.all(0),
    children: [
      SizedBox(
        height: 194,
        width: MediaQuery.of(context).size.width,
        child: DrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(219, 17, 142, 125) ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("24WOW0007", style: TextStyle(fontSize: 19, color: Colors.white)),
              Text("grade2D".tr(), style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 19.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            SizedBox(height: 10.4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "studentInformation".tr(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17.4),
              ),
            ),
            SizedBox(height: 10.4),
            ListTile(
              leading: Icon(Icons.people_alt_sharp, color: Colors.blue),
              title: Text("attendance".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.playlist_add_check_circle_outlined),
              title: Text("discipline".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.health_and_safety, color: Colors.red),
              title: Text("health".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
               SizedBox(height: 10.4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "communication".tr(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17.4),
              ),
            ),
               SizedBox(height: 10.4),
            ListTile(
              leading: Icon(Icons.campaign, color: Colors.grey),
              title: Text("announcements".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Color.fromARGB(255, 75, 241, 244)),
              title: Text("handBook".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.notifications_on_sharp, color: Colors.yellow),
              title: Text("notifications".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Color.fromARGB(255, 223, 197, 159)),
              title: Text("classDiary".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.star, color: Color.fromARGB(255, 255, 160, 17)),
              title: Text("gatePass".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
               SizedBox(height: 10.4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "interaction".tr(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17.4),
              ),
            ),
               SizedBox(height: 10.4),
            ListTile(
              leading: Icon(Icons.chat, color: Color.fromARGB(255, 44, 180, 222)),
              title: Text("studentWallChat".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.chat_outlined, color: Color.fromARGB(255, 254, 96, 99)),
              title: Text("teacherConnect".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.thumbs_up_down_sharp, color: Color.fromARGB(255, 124, 115, 246)),
              title: Text("parentConcernForm".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.photo, color: Color.fromARGB(255, 171, 244, 255)),
              title: Text("gallery".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
               SizedBox(height: 10.4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "academics".tr(),
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17.4),
              ),
            ),
               SizedBox(height: 10.4),
            ListTile(
              leading: Icon(Icons.alarm, color: Color.fromARGB(255, 220, 161, 71)),
              title: Text("timeTable".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month, color: Color.fromARGB(255, 75, 241, 244)),
              title: Text("eventCalendar".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: Color.fromARGB(255, 19, 19, 19)),
              title: Text("assignments".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Color.fromARGB(255, 223, 197, 159)),
              title: Text("resources".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.pie_chart, color: Color.fromARGB(255, 168, 74, 245)),
              title: Text("reportCard".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.4)),
              trailing: Text(">", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ],
        ),
      ),
    ],
  );
}

  Widget listContainer() {
    return Container(
      decoration: BoxDecoration(color: Color.fromARGB(219, 17, 142, 125)),
      height: 104,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.2, top: 11.1),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.campaign,
                    color: Color.fromARGB(255, 92, 91, 91),
                    size: 32,
                  ),
                ),
                SizedBox(height: 3),
                Text("announcements".tr(),
                    style: TextStyle(fontSize: 11.1, color: Colors.white))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 11.1),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.book,
                    color: Color.fromARGB(255, 230, 144, 144),
                    size: 32,
                  ),
                ),
                SizedBox(height: 3),
                Text("classDiary".tr(),
                    style: TextStyle(fontSize: 11.1, color: Colors.white))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 11.1),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.alarm,
                    color: Color.fromARGB(255, 83, 161, 244),
                    size: 32,
                  ),
                ),
                SizedBox(height: 3),
                Text("timeTable".tr(),
                    style: TextStyle(fontSize: 11.1, color: Colors.white))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 11.1),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.library_add,
                    color: Color.fromARGB(255, 164, 255, 151),
                    size: 32,
                  ),
                ),
                SizedBox(height: 3),
                Text("resources".tr(),
                    style: TextStyle(fontSize: 11.1, color: Colors.white))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 14, top: 11.1),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.assignment,
                    color: Color.fromARGB(255, 133, 225, 248),
                    size: 32,
                  ),
                ),
                SizedBox(height: 3),
                Text("applyLeave".tr(),
                    style: TextStyle(fontSize: 11.1, color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget studentGrid(){
    final List<Map<String,dynamic>> items=[
      {"icon":Icons.people,"name":"Attendence","color":Colors.blue},
      {"icon":Icons.rule,"name":"Discipline","color":Colors.orange},
      {"icon":Icons.health_and_safety,"name":"Health","color":Colors.red}
    ];
    
    return GridView.extent(
      shrinkWrap: true, //if we dont give this the flutter dont know how much space it need so if we keep shrinkWrap true then it takes the width sufficent to it
      physics: NeverScrollableScrollPhysics(),
      maxCrossAxisExtent: 77,
    crossAxisSpacing: 14,
    mainAxisSpacing: 14,
    children:items.map((item){
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Icon(item['icon'],color: item['color'],),
            Text(item['name'],style: TextStyle(fontSize: 11.1,color: Colors.black),)],
        ),
      );
    }).toList()
    );
  }
}
