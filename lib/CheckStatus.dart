//Every url in web api is designed for a specific purpose 
//that is if there is login url when we send post request it will check the credentials and helps us to login 
//JWT:JSON web token
//by using this we can send message in secure way from server to client or client to server
//when ever a user logins for the firsttime the server creates a token and sends it to the user
// and when the user try's to login he no need to send request every time instead he will send request only once and with that toke
//for all the requests we send the token no need of username and password this will save memory for sessions
//the structure for JWT has three parts  Header.payload.signature
//header:it tells about the token like type of token:JWT and algo used
//payload:where the user information will be there
//signature:the signature makes sure no one changed the token
//when we make an http request the response will be raw json to convert Dart Map<String,dymanic>
//responseBody=jsonDecode(response.body)
//the response.body contains {status:"",response:""} and this response again contins string to covnert it into map  done agian decode
//i.e nestedResponse=jsonDecode(responseBody['response])
//now we need to get the identity token
//jwtTOKEN=nestedResponse['IdentityToken'];
//now we need to decode the token
//Map<String,dynamic> payloadDecode=JwtDecoder.decode(jwtTOKEN)//this will only extract payload part from jwttoken and decode it

import 'package:flutter/material.dart';
import "dart:convert";
import 'package:encrypt/encrypt.dart' as enc;
import 'package:http/http.dart' as http;
import 'package:projects_flutter/FirstPage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:projects_flutter/ResetValidates.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
class SchoolLogin extends StatefulWidget{
  const SchoolLogin({super.key,});
  @override
  _SchoolLoginState createState()=>_SchoolLoginState();
}
class _SchoolLoginState extends State<SchoolLogin>{  
  final _formKey=GlobalKey<FormState>();
  TextEditingController usercontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  String BranchName='';
  String UserName='';
  int StudentId=0;

  bool obscure_text=true;
  bool? valueOne=false;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
            SizedBox(height: 23,),
            Container(
              height: 274,
              child:Image.asset("assets/littlec.jpeg"),
              ),
             Center(child: schoolName()),
              SizedBox(height: 16,),
              logoStyle(),
              SizedBox(height: 3,),
              companyName(),
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
                  userName(),
                  SizedBox(height: 26,),
                  password(),
                  SizedBox(height: 7,),
                  rememberMe(),
                  SizedBox(height: 18,),
                  loginButton(),
                  SizedBox(height: 36,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>
                          ResetValidates(heading:"Forget Username")
                     ));
                    },
                    child:Center(child: Text("Forgot Username",
                      style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange,
                      ),
                  ),) ,
                  ),
                    GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>
                          ResetValidates(heading:"Password")
                     ));
                    },
                    child:Center(child: Text("/Password ?",
                      style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepOrange,
                      ),
                  ),) ,
                  )
                  ],
                  )
                
                  ],
                  )
                  ),
                  SizedBox(height: 38,),
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
                  policy(),
                  SizedBox(height: 32,),
                  Center(child: Text("Version:1.2.2",style: TextStyle(fontSize: 14,
                  fontWeight: FontWeight.w700),),),
                  SizedBox(height: 32,),
                    ], )
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
                    Future<void> sendRequest()async{
                       Map<String, dynamic> jsonBody1 = {"data": encryptedData()};
                      print("${jsonEncode(jsonBody1)}");
                       final url = Uri.parse(
                                  "https://devparentapi.myclassboard.com/api/Mobile_API_/chkMobileLogin");       
                                 try {
                                        final response = await http.post(
                                        url,
                                        headers: {
                                              "Content-Type": "application/json",
                                              "Accept": "application/json",
                                                },
                                        body: jsonEncode({"data":encryptedData()}),
                                        );
                              // print("Status: ${response.statusCode}");
                              // print("Body: ${response.body}");
                              if (response.statusCode == 200) {
                                final responseBody=jsonDecode(response.body);
                                final nestedResponse=jsonDecode(responseBody['response']);
                                final String jwtToken=nestedResponse['IdentityToken'];
                              //  print("Length original token: ${jwtToken.length}");
                              //   print("First 20 chars original: ${jwtToken.substring(0, 20)}");
                              //     print("Last 20 chars original: ${jwtToken.substring(jwtToken.length - 20)}");
                                Map<String,dynamic> payloadDecode=JwtDecoder.decode(jwtToken);
                                // print(payloadDecode);
                                showsnackbar(context);
                                //student info
                                Map<String,dynamic> studentInfo=nestedResponse['StudentData']??{};
                                BranchName=studentInfo['BranchName']??"No Branch";
                                UserName=studentInfo['UserName']??"No User";
                                 StudentId=studentInfo['StudentEnrollmentID']??0;
                               storage();

                                Navigator.push(context,MaterialPageRoute(builder: (context)=>FirstPage(responseData:payloadDecode,id:jwtToken)));
                              } else {
                                print("fail");
                              }
                              }
                             catch(e){
                               print(e);
                              }
                    }
                   void storage()async{
                    final prefs=await SharedPreferences.getInstance();
                    await prefs.setString('brachName',BranchName);
                    await prefs.setString('username', UserName);
                    await prefs.setInt('id',StudentId);
                   }
                   Widget companyName(){
                    return Center(
                      child: Text("MY CLASS BOARD",
                      style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      ),),
                      );
      }     Widget schoolName(){
                    return Text("Arohona Foundation",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
                    fontFamily: "Karla"),
                    );
                   }
                    Widget logoStyle(){
                      return  Row(
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
                      );
                    }
                    Widget userName(){
                     return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Username / Email",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 12,
                          ),
                          ),
                          SizedBox(height: 7,),
                          userTextField(),
                        ],
                      );
                    }
                    Widget userTextField(){
                      return TextFormField(
                          controller: usercontroller,
                          keyboardType: TextInputType.emailAddress,
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
                          return null;
                        },
                      );
                    }
                    Widget password(){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text("Password",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w700,
                          fontSize: 12),
                          ),
                          SizedBox(height: 7,),
                        passTextField(),
                        ],
                      );
                    }
                    Widget passTextField(){
                      return  TextFormField(
                        controller: passcontroller,
                        obscureText: obscure_text,
                        decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key_outlined),
                        suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          obscure_text=!obscure_text;
                        });
                        },
                        icon: Icon(
                           obscure_text?Icons.visibility_off:Icons.visibility),
                        ),
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
                      );
                    }
                    Widget rememberMe(){
                      return  Row(
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
                        );
                    }
                    Widget loginButton(){
                      return ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () async{
                        // Use a constant org ID that your API accepts
                      if(_formKey.currentState!.validate()){
                                await sendRequest();
                                    
                          } 
                        },
                      child:loginStyle());
                    }
                    Widget loginStyle(){
                      return  Stack(
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
                          child: Icon(Icons.arrow_forward_rounded,size: 19,),
                        )
                      ],
                    );
                    }
                    //ivala oka roje nu verevi chusedi repu mrng ninchi vachedaka nu anukundai ceyali
                    //em cheyali ante
                    //DSA revison,flutter revison
                    //flutter projects like quiz,weather
                    //Main imp is rag model wit our app so 2,3,4,5 4 days
                    //4days vunay kabati 
                    //1)1st day iDSA revsion+flutter Revision,rag knochem vido chudam ,apps 2 days okati anauki complete ceyali
                    //nu neglect chesthe anthe gaytahri
                    //ipudu panadas ,flutter kochem revsion cheyi
                    Widget policy(){
                      return  Center(child: RichText(
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
                    ));
                    }
                     String encryptedData(){
                        Map<String, dynamic> payload = {
                                "userName": "Corp53Schools-${usercontroller.text.trim()}",
                                "password": passcontroller.text.trim(),
                                "userGUID": "",
                                "device_type":"{androidId: U1UGS34.23-82-2-7, fingerprint: motorola/fogos_g/fogos:14/U1UGS34.23-82-2-7/cf0e9a-4d9837:user/release-keys, device: fogos, androidVersion: 14, manufacturer: motorola, brand: motorola, model: moto g34 5G, hardware: qcom}",
                                "deviceModel": "A",
                                "device_id": "59774f0918e1ccb1b8d898021d8dfcba07bf88f6",
                                "device_token":"dRz9gvyhQUmo4JvEy-7xBy:APA91bFL1CjdcRyYQuagRik4lyw97ckkmS5aSylkoiVPzyvbIbpVq3zidaPihw1IkbtxAqCxzNxEF9tKZ32R51I6u-Wt4vtV1yEMo7kPa1UY7NSbhzMXgus",
                                // "e_token":"cEy3KRHKSwSsQAbpNO2Qpn:APA91bH52-RTSq4g8dDqwVAYbqI8jGz80SjDHQuK58tdifhoXc12QEgYMj23UHRloSjeTBB8RGiw-IJqa_T8VJzJJDK9Pzz-gU2CWxW9sNzbWE9cBO-_AIk",
                                "usercurrentversion": "2.4.9",
                                "packagename": "com.mcb.arohanaeducationalsociety",
                                "apikey": "hjysgt87e-andcommparent-84376-mcb-dt34986tj",
                                "organisationID":24 
                      }; // Use a constant org ID that your API accepts
                      String payloadString = jsonEncode(payload); 
                      final key = enc.Key.fromUtf8("AI0WZVEU922NW4JX4HNKRVYGE2OST619");
                              final iv = enc.IV.fromUtf8("PSBCNLAQORFKUPBZ");
                              final encrypter = enc.Encrypter(enc.AES(key, mode: enc.AESMode.cbc));
                              final encrypted = encrypter.encrypt(payloadString, iv: iv);
                              return encrypted.base64;
                      }
                  }