//easy localization is a package that helps trasnlate our app easily by using json files, i.e instead of 
//manually changing each text in our app we store them in json files, the app automatically picks the correct translation based on the user's choice




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:projects_flutter/InfoPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget{
final Map<String,dynamic>responseData;

final String id;
const FirstPage({super.key,required this.responseData,required this.id});
@override
_FirstPageState createState()=>_FirstPageState();
}
class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin{
  String branchNamee='';
 String userNamee='';
 int student_ID=0;
  Icon icon1=Icon(Icons.check);
  int selectedIndex=-1;
  @override
void initState(){
  super.initState();
  printToken(widget.id);
 
  loadData();
}
Future<void> loadData()async{
final prefs=await SharedPreferences.getInstance();
setState(() {
  branchNamee=prefs.getString('brachName')??'no string';
userNamee=prefs.getString('username')??'no string';
student_ID=prefs.getInt('id')??0;
});
 testing();

}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: Text("Wings Of Wonder The Foundaion",maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Roboto',letterSpacing: 1.7),),backgroundColor: const Color.fromARGB(219, 17, 142, 125),
      actions: [
        IconButton(onPressed: (){
            showAlert(context);
        }, icon: Icon(Icons.person_add_alt_1_outlined),color: Colors.white,),
        IconButton(onPressed: (){
            showDropDown(context);
        }, icon:Icon(Icons.translate,color: Colors.white,))
      ],
      ),
      body:Stack(
        children: [
           Column(
        mainAxisSize: MainAxisSize.max,
        children: [
        image(),
        content(),
        ],),
        bottom(),
        ],)  
    );
  }
    Widget image(){
      return   Container(
            margin: EdgeInsets.only(top: 50,left: 23,bottom: 16),
            height: 189,width: 320,decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 255, 255)),child:  Align(
            alignment: Alignment.topCenter,child:Image.asset("assets/wingsOfWonder.png",
          height: 189,
          width: 320,
      fit: BoxFit.contain,) ,
          ),);
    }
   Widget content() {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(219, 17, 142, 125), // Green background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14), // Rounded corners
        ),
        padding: EdgeInsets.zero, // Remove default padding
        elevation: 0, // Optional: remove button shadow
      ),
      child: Container(
        width: 370,
        height: 152.6,
        padding: EdgeInsets.all(14),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: NetworkImage(
                      'https://cdndatastatic.myclassboard.com/Images/NoPicture.gif'),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.responseData['given_name'] ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Flexible(
                        child: Text(
                          branchNamee,
                          overflow: TextOverflow.ellipsis,
                        //  maxLines: 2,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      Text(
                        "Grade 2-D",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        userNamee,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "24/0078",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 14,
              right: 14,
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 23,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

    Widget bottom(){
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(height: 30,width: double.infinity,
        decoration: BoxDecoration(color: Color.fromARGB(219,17,142,125) ,),));
    }
  












void printToken(String id){
  print("identityToken is $id");
    print("First 20 chars next page: ${id.substring(0, 20)}");
     print("Last 20 chars next page: ${id.substring(id.length - 20)}");
     testing();
}
//sending request using dio and graphQL
Future<void> testing() async{
  final dio=Dio();
  String url="https://parentapi.myclassboard.com/AppGraph";
  String token="eyJhbGciOiJSUzI1NiIsImtpZCI6IkMyQjY4ODgyNkVEMjc4QzlEOUM3OUUxQzAwRjdBRDQ2IiwidHlwIjoiSldUIn0.eyJuYmYiOjE3NTg4MDUxNTQsImV4cCI6MTc1ODkxMzE1NCwiaXNzIjoiaHR0cHM6Ly9zc29saXZlLm15Y2xhc3Nib2FyZC5jb20iLCJhdWQiOiJYRUc5TDBYTUdHTzhFOUg0V0VIQyIsImlhdCI6MTc1ODgwNTE1NCwiYXRfaGFzaCI6IkFQQXg1QXZiZEhQLXBUSDBXWEZ2R2ciLCJzdWIiOiI4MGM0NjZlNi0zOTY0LTQyMTYtYjFlOC1hZGQ1MjliYmI5NTYiLCJhdXRoX3RpbWUiOjE3NTg4MDUxNTQsImlkcCI6ImxvY2FsIiwiZ2l2ZW5fbmFtZSI6IkFha2Fua3NoYSBBdGx1cnkgICIsImZhbWlseV9uYW1lIjoiUmFodWwgQXRsdXJ5IiwicGljdHVyZSI6Imh0dHBzOi8vY2RuZGF0YXN0YXRpYy5teWNsYXNzYm9hcmQuY29tL0ltYWdlcy9Ob1BpY3R1cmUuZ2lmIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiQ29ycDUzU2Nob29scy0yNFdPVzAwMDciLCJuYW1lIjoiQ29ycDUzU2Nob29scy0yNFdPVzAwMDciLCJhbXIiOlsicHdkIl19.UrCrBF-Zpskbobpk0kUHy-7rZXdDwy1TTLp81mgFCfx6tBBZ7DqgGWVyisyvhXCrQX4nFHx7toUHUU-QboCDWOmPkg9n1uAULQS6uJfOd_D5tJSPWHaCQnmqJneLUNdJefPzWJ1WVzZNzqEgx9TyCqInmR50dqT6J_LjGJZP0h5SXtT3gxsflE4hro3W2zD72XIgR6O9l_TQCjF54yeJ15q1TsL2VlNA0IUYO9WlJwYEXXgdYKIejm32P2khuGsB4sDRVyJGUllxtZKo8IGdC2iOrgN8puwdifpp5enWHgZ5FxV0cC2AHwDcyxC6_SqNOj4AkjVSHYMjhctteUWdBg";
   String query="""
      query GetStudentDairyCount {
    getStudentDairyCount_Android(studentEnrollmentID: $student_ID) {
        homeWorkCount
        homeWorkSubmittedCount
        classWorkCount
        assignmentCount
        announcementCount
        messageCount
        diaryCount
        latestDairyDate
    }
}
""";
try{
  var response=await dio.post(url,data: {
    'query':query,
  },
  options: Options(headers:{ 
  "Authorization":"Bearer $token",
  "contentType":"application/json",}, ),
  );
  print(response.data);
}
catch(e){
  print("Exception is $e");
}
}





  void showAlert(BuildContext context){
      showGeneralDialog(context: context,
           pageBuilder: (context,Animation<double>animation,Animation<double>secondaryAnimation){
              return 
              Material(
                color: Colors.transparent,
                child:Align(alignment: Alignment.topCenter,
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(62, 61, 61, 0.494),
                  border: null,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Alert",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                    SizedBox(height: 9,),
                    Text("No Siblings Found",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14),)
                  ],
                ),
              
              ),));
          },
          barrierDismissible:true,
          barrierLabel:"dismiss",
          barrierColor: Colors.transparent,
          transitionBuilder: (context,Animation<double>animation,Animation<double>secondaryAnimation,child){
              final slideAnimation=Tween<Offset>(
                begin: Offset(0,-1),
                end: Offset(0,0)
              ) .animate(CurvedAnimation(parent: animation, curve:Curves.easeOut));
            return SlideTransition(position:slideAnimation,child:child);
          }
      );
       Timer(Duration(seconds: 5),(){
        Navigator.of(context,rootNavigator: true).pop();
      });
    }
void showDropDown(BuildContext context) {
  List<Map<String, String>> languages = [
    {"name": "English", "code": "en"},
    {"name": "Hindi", "code": "hi"},
    {"name": "Telugu", "code": "te"},
    {"name": "Tamil", "code": "ta"},
    {"name": "Kannada", "code": "kn"},
    {"name": "Marathi", "code": "mr"},
    {"name": "Sanskrit", "code": "sa"},
  ];

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      // Initialize localSelectedIndex from parent selectedIndex
      int localSelectedIndex = selectedIndex;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final languageName = languages[index]['name'] ?? 'Unknown';
              final languageCode = languages[index]['code'];

              return ListTile(
                title: Text(
                  languageName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: localSelectedIndex == index
                    ? const Icon(Icons.check, color: Colors.black)
                    : null,
                onTap: () {
                  if (languageCode != null) {
                    // Update local bottom sheet
                    setModalState(() {
                      localSelectedIndex = index;
                    });
                    // Update parent state
                    setState(() {
                      selectedIndex = index;
                    });
                    // Change app locale
                    EasyLocalization.of(context)?.setLocale(Locale(languageCode));
                    // Close sheet
                    Navigator.pop(context);
                  }
                },
              );
            },
          );
        },
      );
    },
  );
}













  // OverlayEntry? overlayEntry;

  // AnimationController ac = AnimationController(
  //     vsync: this, duration: Duration(milliseconds: 300));
  // Animation<Offset> animation = Tween<Offset>(
  //   begin: Offset(0, 1),
  //   end: Offset(0, 0),
  // ).animate(CurvedAnimation(parent: ac, curve: Curves.easeOut));

  // overlayEntry = OverlayEntry(
  //   builder: (context) => Stack(
  //     children: [
  //       GestureDetector(
  //         onTap: () {
  //           ac.reverse().then((value) {
  //             overlayEntry?.remove();
  //             ac.dispose();
  //           });
  //         },
  //         child: Container(color: Colors.black54),
  //       ),
  //       Positioned(
  //         bottom: 0,
  //         left: 0,
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height * 0.5,
  //         child: Material(
  //           child: SlideTransition(
  //             position: animation,
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
  //               ),
  //               child: ListView(
  //                 children: List.generate(7, (index) {
  //                   List<String> languages = [
  //                     "English",
  //                     "Hindi",
  //                     "Telugu",
  //                     "Tamil",
  //                     "Kannada",
  //                     "Marathi",
  //                     "Sanskrit"
  //                   ];
  //                   return ListTile(
  //                     title: Text(
  //                       languages[index],
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     ),
  //                     trailing: selectedIndex == index ? Icon(Icons.check) : null,
  //                     onTap: () {
  //                       setState(() {
  //                         selectedIndex = index;
                          
  //                       });
  //                       Navigator.pop(context);
  //                     },
  //                   );
  //                 }),
  //               ),
  //             ),
  //           ),
  //         ),
  //       )
  //     ],
  //   ),
  // );
  // Overlay.of(context).insert(overlayEntry);
  // ac.forward();A
}
