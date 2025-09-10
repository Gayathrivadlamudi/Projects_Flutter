import 'package:flutter/material.dart';
import './WelcomePage.dart';
void main(){
  runApp(
    MaterialApp(
      home:Login(),
      debugShowCheckedModeBanner:false,
    )
  );
}
class Login extends StatefulWidget{
  @override
  _LoginState createState()=>_LoginState();
}
class _LoginState extends State<Login>{
  final _formKey=GlobalKey<FormState>(); 
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Center(child:Text("Student Login page",
    style: TextStyle(color: Colors.white),
    )),
    backgroundColor: const Color.fromARGB(255, 14, 57, 92),
 ),
    backgroundColor: Color(0xFF1C6EA4),
    body:  Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(23),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(left:55,top:83),
        child:
        Form(
          key: _formKey,
          child: Column(
          children: [
           SizedBox(height: 27,),
           Text("Login",
           style: TextStyle(
            fontSize: 23,
           ),
            textAlign: TextAlign.center,
          ),
          
            Padding(padding: EdgeInsets.only(left: 14,right: 14,top:49),
            child:TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                 borderRadius:BorderRadius.circular(15), 
                ),
                focusedErrorBorder:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15)
                )
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "please provide email";
                }
                else if(!RegExp(r'^[\w.-]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)){
                  return "please enter valid email";
                }
              },
            )
            ),
             Padding(padding: EdgeInsets.only(left: 14,right: 14,top:23),
            child:
            TextFormField(
              controller: pass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "PassWord",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return "please enter password";
                }
                else if(value.length >8){
                  return "please enter password less than 8 characters";
                }
              },
              
            )
            ),
            SizedBox(height: 23,), 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 105, 180, 215),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                
                )
              ),
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  if(email.text=="gayathrichowdary441@gmail.com" && pass.text=="12345678"){
                    Navigator.push(context, //push means we are adding a new page and context tell where are we that it tells about current widget
                    MaterialPageRoute(builder: (context)=>//MaterialPageRoute this give us animation like sliding same like andriod
                      WelcomePage(),
                     ) 
                    );
                  }
                }
                
            }, child: Text("Login",
            style: TextStyle(color: const Color.fromARGB(255, 8, 8, 8),
            fontSize: 16),
)) ,
          ],
        ), )
        
    )
    ,
   );
  }
}