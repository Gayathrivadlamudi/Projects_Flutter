import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home:caluclator()));
}
class caluclator extends StatefulWidget{
 const caluclator({super.key});
  _caluclatorState createState()=>_caluclatorState();
}
class _caluclatorState extends State<caluclator>{ 
  TextEditingController amtController =TextEditingController();
  bool showContainer=true;
  int val=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Center(child: Text("Caluclator App 📱")),),
    backgroundColor: const Color.fromARGB(255, 2, 52, 93),
    body: Column(
      children: [
        Padding(padding: EdgeInsets.only(top:250),
        child: Center(child: Text("\$  ➡️ rupee",style: TextStyle(color: Colors.white,fontSize: 25),),)),
        showContainer?  Container(
          margin: EdgeInsets.only(top:23),
          height: 230,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            boxShadow:[ 
              BoxShadow( color: Colors.black, // semi-transparent shadow
        offset: Offset(10,10),   //positive means right and bottom and -ve means left and top              // moves shadow to bottom-right
        blurRadius: 8,                        // makes shadow softer
        spreadRadius: 2,   )]
          ),
          
          child: Column(
            children: [
            Padding(padding: EdgeInsets.only(top:50,left:12,right: 12,bottom: 14),
            child:TextFormField(
                controller: amtController,
                decoration: InputDecoration(
                  labelText: "Enter Amount",
                  enabledBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1.5),
                ),
                 focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1.5),
                ),
                 errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 1.5, color: const Color.fromARGB(255, 1, 0, 0)),),
                 focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 1.5, color: const Color.fromARGB(255, 11, 11, 11)),),
                ),
              )),
              Padding(padding:EdgeInsets.only(top:18,left:12,right: 12,bottom: 16),
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(28,16,28,16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color.fromARGB(255, 6, 50, 87)
                ),
                onPressed: (){
               val= int.parse(amtController.text)*81;
               setState((){
                 showContainer=false;
                 });
              }, child: Text("Convert",style: TextStyle(color: Colors.white,fontSize:21),)),
               )
              
            ],
          ),
        ): Container(
          margin: EdgeInsets.only(top:23),
          height: 230,
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            boxShadow:[ 
              BoxShadow( color: Colors.black, // semi-transparent shadow
        offset: Offset(10,10),   //positive means right and bottom and -ve means left and top              // moves shadow to bottom-right
        blurRadius: 8,                        // makes shadow softer
        spreadRadius: 2,   )]
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Center(child: Text("Rupees $val",style: TextStyle(fontSize: 23),),),
                  SizedBox(height: 14,),
                  ElevatedButton(
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(28,16,28,16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color.fromARGB(255, 6, 50, 87)
                ),
                onPressed: (){
              
               setState(() {
                 showContainer=true;
                 amtController.text="";
               });
              }, child: Text("Convert Again",style: TextStyle(color: Colors.white,fontSize:21),)),
            ],
          )
          
         
        )
      ],
    ),
    
    );
  }
}