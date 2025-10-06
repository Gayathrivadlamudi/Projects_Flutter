//Every url in web api is designed for a specific purpose 
//that is if there is login url when we send post request it will check the credentials and helps us to login 
import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    home:SchoolLogin(),
  ));
}
class SchoolLogin extends StatefulWidget{
  const SchoolLogin({super.key,});
  @override
  _SchoolLoginState createState()=>_SchoolLoginState();
}
class _SchoolLoginState extends State<SchoolLogin>{  
  final _formKey=GlobalKey<FormState>();
  TextEditingController usercontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
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
          Center(child: Text("Arohona Foundation",
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
                           decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
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
                             return "please enter password";
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
                      onPressed: () async{
                        if(_formKey.currentState!.validate()){
                              final url = Uri.parse(
                                  "https://devparentapi.myclassboard.com/api/Mobile_API_/chkMobileLogin");
                             try {
                          final response = await http.post(
                            url,
                            headers: {
                              "Content-Type": "application/json",
                              "Accept": "application/json"
                            },
                            body: jsonEncode({"data":"2OM0t8cmKUXLjc+jKh9BdAbBw1BCosB2YGxyfBEQRR+P52awk6xUyLyILvAlxpMqwHgmN7eReSImN98sd4ED7qxfxSz8VSA+y3adcRQoBF8t2jz33Rc1sluJ5gHMtuCYShtcEaRkf431P2PBGO1WFZQ9leQqGLGu7FTKrll38qeqPEuf0zQbdPjMESWdDGbRNMYfuNCQjW2LeCBtMxD0S79deAFJIS0kJdVNCk7P+FnFK4LAN3qzZcXNAVtzUo6Q3ordoaD0O2zljEjHU+gJk1jk2/rsoBdedHy5lRWslGLd9uEU+DjL1iZ7uxSZVrc8aA7c4PTAfclwF0tVFqbXgpZoAWYmgx/fC2LKTpNCMbrVuMFXDcG/XlZDUee/vZF1VpMvPDWcrB+wFLmbwqoWLllGqUSsv0sEs3DLlvYYyfdsNvVl2MvQEZWnHbvCZJsahqtM3pnvqhuUDCYhRBbxUaQDf3WV7Jgg+hGNXmTM/Bw8xxp9nj0giCl0tHytvA/sCmmPqi7sXXzsQbDXw3PqbKoKPgwhlcPSOifB7O33nFpbsOQnzgg3+8SP4/YnMxRk2Gm5kJT8bI34yNRwX0ydzMwr2R8ykX/7rsPHE0IcpotZnar6WapaTnEtuRSdYyZ2e7UiIe+e8+8+jRU7Is1O5SHb/Tzujj6UQRqcDrUSUVs4+iyLahNBcRljmoxq/Ccx8YfR9mG59bsgvc+8PLsbo7JBY20n6+v+HLW+DSd8qhBgqIU3/H+gtjSWID94lqci+3XRB1idDVwUfAe0N1okkUB3vkh+S312uxHv8KmoYPtBg063Dd7cY23GF1vMG9zX+f5a1YTMN12hDCNFiri+pHQP27Y+/fOwZyOcO9j7hRRF0BrR60tg3iqYnzLGpH0GVmSqhIDRxJV0x5MNafoYHRuwVek6QIXZhhTGN5eEn6u8HVB7kszAw8Z/1cEyGZR7"}),
                          );
                          print("Status: ${response.statusCode}");
                          print("Body: ${response.body}");
                                              if (response.statusCode == 200) {
                        var decoded = jsonDecode(response.body);
                        if (decoded["status"] == "success") {
                          String token = decoded["data"]["token"];
                          // store token in shared preferences for later API calls
                          showsnackbar(context);
                        } else {
                          print("Login failed: ${decoded["message"]}");
                        }
                      } else {
                        print("HTTP Error: ${response.statusCode}");
                      }
                        }
                        catch(e){
                          print(e);
                        }
                        } 
                    },
                    child: Stack(
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