import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects_flutter/SchoolNameSearch.dart';
import 'WelcomePage.dart';
import 'package:get/get.dart';
// void main(){
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner:false,
//     home:SchoolLogin(img,name),
//   ));
// }
class SchoolLogin extends StatefulWidget{
  final String img;
  final String name;
  const SchoolLogin({super.key,required this.img,required this.name});
  @override
  _SchoolLoginState createState()=>_SchoolLoginState();
}
class _SchoolLoginState extends State<SchoolLogin>{
  
  final _formKey=GlobalKey<FormState>();
  TextEditingController usercontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  bool obscure_text=true;
  bool? valueOne=false;
  Widget? i;
  @override
  void initState(){
    super.initState();
    setState((){
     String encodedUrl=Uri.encodeFull(widget.img);
    Widget i=Image.network(encodedUrl,fit:BoxFit.cover,
    errorBuilder: (context,error,StackTrace){
      return Container(
        color: Colors.grey[200],
        child:Icon(Icons.school),
      );
    },);
  })
  }
  @override
  Widget build(BuildContext context){
    int ind=(widget.name).indexOf("(");
    String editedName=(widget.name).substring(0,ind);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
          SizedBox(height: 23,),
       Align(alignment: Alignment.topLeft,
        child: Padding(padding: EdgeInsets.all(16.0),
        child: IconButton(onPressed: (){
          Get.to(()=>SchoolNameSearch());
        }, icon: Icon(Icons.arrow_back,
        color: Colors.black,
        size: 28,)),),),
          Container(
            height: 274,
             child:i,
            // Image.network(encodedUrl,
            // fit:BoxFit.cover,
            // // errorBuilder: (context,error,StackTrace){
            // //   return Container(
            // //     color: Colors.grey[200],
            // //     child: Icon(Icons.school),
            // //   );
            // // },
            // ),
          ),
          Center(child: Text(editedName,
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
          fontFamily: "Karla"),
          ),),
          SizedBox(height: 16,),
         Row(
          children: [
            Expanded(child:  Container(
              height: 2,
              width: 160,
              decoration: BoxDecoration(
                color: const Color.fromARGB(245, 211, 211, 211),
                borderRadius: BorderRadius.circular(23)
              ),
            ),),
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color.fromARGB(255, 227, 57, 45),
              child: Text("M",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),),
            ),
             CircleAvatar(
              radius: 10,
              backgroundColor: const Color.fromARGB(255, 239, 219, 37),
             child: Text("C",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),),
            ),
             CircleAvatar(
              radius: 10,
              backgroundColor:const Color.fromARGB(255, 1, 57, 178),
              child: Text("B",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),),
            ),
            Expanded(child:Container(
              height: 2,
              width: 156,
              decoration: BoxDecoration(
                color: const Color.fromARGB(245, 211, 211, 211),
                borderRadius: BorderRadius.circular(23)
              ),
            ),),
          ],
         ),
         SizedBox(height: 3,),
         Center(
          child: Text("MY CLASS BOARD",
          style: TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w700,
          ),),
         ),
         SizedBox(height: 18,),
        Expanded(child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(246, 244, 244, 244),
          ),
          child: Padding(padding: EdgeInsets.only(top:21,left:23,right: 23),
          child:SingleChildScrollView(
            child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                children: [
                  SizedBox(height: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username / Email",textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 12,
                      ),
                      ),
                      SizedBox(height: 7,),
                      TextFormField(
                         controller: usercontroller,
                         keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                // RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                  RegExp(r'[\w@.-]'),
                ),
              ],
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          // labelText: "Username/Email",
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Please Enter Email";
                          }
                           else if (!RegExp(r'^[\w.-]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                                return "Enter a valid email address";
                                }
                            return null;
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 26,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text("Password",textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: 12),
                      ),
                      SizedBox(height: 7,),
                      TextFormField(
                        controller: passcontroller,
                          obscureText: obscure_text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key_outlined),
                         suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obscure_text=!obscure_text;
                          });
                         }, icon: Icon(
                           obscure_text?Icons.visibility_off:Icons.visibility),),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(14)
                          )
                        ),
                        validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                      )
                    ],
                  ),
                  SizedBox(height: 7,),
                  Row(
                    children: [
                      Checkbox(value: this.valueOne,
                      onChanged: (bool? value){
                        setState(() {
                          this.valueOne=value!;
                        });
                      },
                      activeColor: Colors.deepOrange,
                      checkColor: const Color.fromARGB(255, 249, 249, 248),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color:Colors.deepOrange,width: 5),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      ),
                      // SizedBox(width: 7,),
                      Text("Remember me",
                      style: TextStyle(color: Colors.deepOrange,
                      fontSize: 14,
                      fontWeight:FontWeight.w700 ),
                      )
                    ],
                  ),
                  SizedBox(height: 18,),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                    if(usercontroller.text=="gayathrichowdary441@gmail.com" && passcontroller.text=="12345678"){
                       showsnackbar(context);
                       Future.delayed(Duration(seconds: 1),(){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>
                             WelcomePage()
                         ));
                       });
                    }
                    }
                    },
                    child: Stack(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child:  Text("Log In",
                        style: TextStyle(color: Colors.white,
                        fontSize: 14,
                          fontWeight: FontWeight.w700
                        ),
                        ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child:   Icon(Icons.arrow_forward_rounded,size: 19,),
                        )
                      ],
                    ),
                       ),
                    SizedBox(height: 36,),
                    Center(child: Text("Forget Username/Password ?",
                      style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange,
                      ),
                    ),)
                  ],
              )
              ),
              SizedBox(height: 38,),
              // Row(
              //   children: [
              //     //here every parent provide constraints which gives width here row provides the width
              //     Expanded(child:LayoutBuilder(builder: (context,Constraints){
              //         return Flex(direction: Axis.horizontal,
              //         children:List.generate((Constraints.constrainWidth()/10).floor(), (index)=>
              //             SizedBox(width: 5,
              //             height: 2,
              //             child: DecoratedBox(decoration: BoxDecoration(color: const Color.fromARGB(255, 40, 38, 38))),)
              //         ),
              //         );
              //     })
              //     ),
              //     Center(child: Text("Or"),),
              //     Expanded(child:LayoutBuilder(builder: (context,Constraints){
              //       return Flex(direction: Axis.horizontal,
              //       children: List.generate((Constraints.constrainWidth()/15).floor(), (index)=>
              //         SizedBox(width: 5,
              //         height: 2,
              //         child: DecoratedBox(decoration: BoxDecoration(color: const Color.fromARGB(255, 61, 60, 60))),)
              //       ),);
              //     })),
              //   ],
              // )

              // Row(
              //   children: [
              //     Text("------------- --------------------------",style: TextStyle(color: Colors.black),),
              //     Center(child: Text("Ok",style: TextStyle(color: Colors.black),),),
              //     Text("---------------",style: TextStyle(color: Colors.black),)
              //   ],
              Text("- - - - - -  - - - - - - - - - - or -  - - - - - - - - - - - - - - - ",
              style:TextStyle(fontSize:16)),
              SizedBox(height: 16,),
              Text("Sign in with",style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w700),),
              SizedBox(height: 14,),
              Image.asset("assets/SignIns.png"),
              SizedBox(height: 18,),
              Center(child: Text("By logging in, you agree to MyClassBoard's",
              style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w700),),),
              Center(child: RichText(
                text: TextSpan(
                  text: "Condition's of Use and",
                  style: TextStyle(color: Colors.black,fontSize: 12,
                  fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: " Privacy policy",
                      style: TextStyle(color: Colors.red,fontSize: 12,
                      fontWeight: FontWeight.w700)
                    )
                  ]
                ),
              )),
              SizedBox(height: 32,),
              Center(child: Text("Version:1.2.2",style: TextStyle(fontSize: 14,
              fontWeight: FontWeight.w700),),),
              SizedBox(height: 32,),
            ],
          )
          )
          ),
        ))
        ],
      )
    );
  }
  void showsnackbar(BuildContext context){
    SnackBar snack=SnackBar(content: Text("Login Successful"));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

}