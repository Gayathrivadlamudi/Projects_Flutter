import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){
  runApp(MaterialApp(home:SchoolNamePostReq()));
}
class SchoolNamePostReq extends StatefulWidget{
  const SchoolNamePostReq({super.key});
  @override
  _SchoolNamePostReqState createState()=>_SchoolNamePostReqState();
}
class _SchoolNamePostReqState extends State<SchoolNamePostReq>{
  List<Map<String,dynamic>> schools=[];
  @override
  void initState(){
    super.initState();
    fetchSchools();
  }
  Future<void> fetchSchools() async{
      final url=Uri.parse("https://parentapi.myclassboard.com/api/Mobile_API_/GetAllSchools");//it is used to change the String into uri object
      final response=await http.post(url,headers: {"Content-Type" : "application/json"},body: jsonEncode({}));
      if(response.statusCode==200){
        Map<String,dynamic> SchoolResponse=jsonDecode(response.body);
        //decoding response present in i.e {}
        List<dynamic> SchoolInfoArray=jsonDecode(SchoolResponse['response']);
        //this response is in also json format so we converted it into dart object(either object or array) and 
        //if json is key:value we store in Map and if it is array we store it in list<dynamic>
        List<Map<String,dynamic>> SchoolInfo=SchoolInfoArray.map((school){
          return {
            "schoolId":school['SchoolID'],
            "schoolName":school['SchoolName'],
          };
        }).toList();//.map() it is funtion which converts each element into something else but it returns an iterable but we need list so we dont .toList 
        setState(() {
          schools=SchoolInfo;
        });
      }
      else{
        print("error");
      }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Center(child: Text("This is about API post request"),),),
    body:ListView.builder(
      itemCount: schools.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(schools[index]["schoolName"]??"No Name"),
        );
      },
    ) ,
    );
  }
}