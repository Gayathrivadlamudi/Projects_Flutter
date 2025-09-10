import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart' ;
import 'package:projects_flutter/SchoolLogin.dart';
void main(){
//addListner is a method that allows us to listen to the changes happen to the object so we attach to the some controller when wever a change occurs it will call a callback funtion
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner:false,
    home:SchoolNameSearch()));
}
class SchoolNameSearch extends StatefulWidget{
  const SchoolNameSearch({super.key});
  @override
  _SchoolNameSearchState createState()=>_SchoolNameSearchState();
}
class _SchoolNameSearchState extends State<SchoolNameSearch>{
  TextEditingController searchController=TextEditingController();
  List<Map<String,dynamic>> schools=[];
  List<Map<String,dynamic>> filterdSchools=[];
  @override
  void initState(){
    super.initState();
    fetchSchools();
    searchController.addListener((){
      filterSchools();
    });
  }
  Future<void>fetchSchools() async{
    final URL=Uri.parse("https://parentapi.myclassboard.com/api/Mobile_API_/GetAllSchools");
    final response=await http.post(URL,headers:{"Content-Type":"application/json"},body: jsonEncode({}));
    if(response.statusCode==200){
        Map<String,dynamic> schoolResponse=jsonDecode(response.body);
        List<dynamic> SchoolInfoArray=jsonDecode(schoolResponse['response']);
        List<Map<String,dynamic>> schoolInfo=SchoolInfoArray.map((ele){
          return{
            'schoolId':ele['SchoolId'],
            'schoolName':ele['SchoolName'],
            'logoUrl':ele['AppLogoUrl'],
          };
        }).toList();
        setState(() {
          schools=schoolInfo;
        });
    }
  }
  void filterSchools(){
      String query=searchController.text.toLowerCase();
      if(query.isEmpty){
        setState(() {
          filterdSchools=[];
        });
      }
      else{
        List<Map<String,dynamic>> suggestion=schools.where((schl){
          String schoolName=(schl['schoolName']??"").toLowerCase();
          return schoolName.startsWith(query) || check(schoolName,query);
        }).toList();
        print("hi");
      
      setState(() {
        filterdSchools=suggestion;
      });
      }
  }
  bool check(String sn,String query){
    String newSn=sn.replaceAll(" ", "");
    if(newSn.startsWith(query)){
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
    body:Column(
      children: [

        Center(child: Text("School Lists",style: TextStyle(color: Colors.black),),),
        SizedBox(height: 23,),
        Center(child: 
    Padding(padding: EdgeInsets.only(top:23,left: 14,right: 14),
    child: TextFormField(controller:searchController ,
    decoration: InputDecoration(
      labelText: "Search School",
      suffixIcon:Icon(Icons.search_rounded),
      hintText: "Enter School Name",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(23),
        borderSide: BorderSide(width: 1.2)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(23),
        borderSide: BorderSide(width: 1.2)
      )
    ),
    ) ,),
   ),
    SizedBox(height: 20,),
    if(filterdSchools.isNotEmpty)
    Expanded(child:   ListView.builder(
            itemCount: filterdSchools.length,
            itemBuilder: (context,index){
              var school=filterdSchools[index];
              return ListTile(
                title: Text(filterdSchools[index]['schoolName']??" jdfak",style: TextStyle(color: const Color.fromARGB(255, 16, 16, 16)),),
                onTap: (){
                  Get.to(()=>SchoolLogin(img:school['logoUrl'],name:filterdSchools[index]['schoolName']));
                },
              );
            },
           )
          
          
         
        )

      
    
      ],
    )
    );
  }
}