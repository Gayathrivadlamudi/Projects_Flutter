//for dropdown to style the height of list we use dropdown_button2: ^1.9.0  this which have heigh property

import 'package:flutter/material.dart';
class ResetValidates extends StatefulWidget{
 final String heading;
 ResetValidates({required this.heading});
 @override
  _ResetValidatesState createState()=>_ResetValidatesState();
}
class _ResetValidatesState extends State<ResetValidates>{
  TextEditingController Mobilecontroller=TextEditingController();
  TextEditingController DOBController=TextEditingController();
  TextEditingController userController=TextEditingController();
  TextEditingController emailController=TextEditingController();
   String selectedCode="+91";
   String selectedChoice = "Email ID";
  final _formKey=GlobalKey<FormState>();
   @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor:Color(0xFFF5F5F5),
      extendBodyBehindAppBar:true,
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 255, 71, 15),
      iconTheme: IconThemeData(color: Colors.white,size: 23),
      title:Padding(padding: EdgeInsets.only(left:48),child:  Text(widget.heading,style: TextStyle(color: Colors.white,fontSize:19,fontWeight:FontWeight.bold),),)
          ),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top:104,left:19,right: 19),
            child:Form(
              key: _formKey,
              child: (widget.heading=="Forget Username")?  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("Mobile Number",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black
                          ),),
                          SizedBox(height:12,),
                          MobileTextField(),
                          SizedBox(height: 23,),
                           Text("Student DOB",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black
                          ),),
                           SizedBox(height:12,),
                           DOBTextField(context),
                           SizedBox(height: 19,),
                           checkDetailsButton(),
                  ],
            ):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Username",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                          ),),
                           SizedBox(height:12,),
                           userTextField(),
                           SizedBox(height:16 ,),
                           Text("Search By",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                          ),),
                          RadioWidget(context),
                           SizedBox(height: 16,),
                           Text(selectedChoice,textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                          ),), 
                           SizedBox(height:14 ,),
                         selectedChoice == "Email" 
                                  ? EmailTextField() 
                                  : MobilePTextField(), 
                           SizedBox(height: 19,),
                           requestDetailsButton(),  ],
              ),) 
     ) ));
  }

























  
  Widget MobileTextField(){
   
    return Container(
      height:54,
  decoration: BoxDecoration(
    color: Colors.white, // background of the field
    borderRadius: BorderRadius.circular(9),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 240, 238, 238), // shadow color
        spreadRadius: 2,  // how wide the shadow spreads
        // blurRadius: 10,    // blur intensity
        offset: Offset(1,1), // x and y offset
      ),
    ],
  ),
  child: TextFormField(
    controller: Mobilecontroller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      prefixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 5),
      child: DropdownButtonHideUnderline(child:DropdownButton(
        value: selectedCode,
        items:[
                  DropdownMenuItem(value: "+1", child: Text("+1")),
          DropdownMenuItem(value: "+7", child: Text("+7")),
          DropdownMenuItem(value: "+20", child: Text("+20")),
          DropdownMenuItem(value: "+27", child: Text("+27")),
          DropdownMenuItem(value: "+30", child: Text("+30")),
          DropdownMenuItem(value: "+31", child: Text("+31")),
          DropdownMenuItem(value: "+32", child: Text("+32")),
          DropdownMenuItem(value: "+33", child: Text("+33")),
          DropdownMenuItem(value: "+34", child: Text("+34")),
          DropdownMenuItem(value: "+36", child: Text("+36")),
          DropdownMenuItem(value: "+39", child: Text("+39")),
          DropdownMenuItem(value: "+44", child: Text("+44")),
          DropdownMenuItem(value: "+49", child: Text("+49")),
          DropdownMenuItem(value: "+52", child: Text("+52")),
          DropdownMenuItem(value: "+55", child: Text("+55")),
          DropdownMenuItem(value: "+60", child: Text("+60")),
          DropdownMenuItem(value: "+61", child: Text("+61")),
          DropdownMenuItem(value: "+62", child: Text("+62")),
          DropdownMenuItem(value: "+63", child: Text("+63")),
          DropdownMenuItem(value: "+64", child: Text("+64")),
          DropdownMenuItem(value: "+65", child: Text("+65")),
          DropdownMenuItem(value: "+66", child: Text("+66")),
          DropdownMenuItem(value: "+81", child: Text("+81")),
          DropdownMenuItem(value: "+82", child: Text("+82")),
          DropdownMenuItem(value: "+84", child: Text("+84")),
          DropdownMenuItem(value: "+86", child: Text("+86")),
          DropdownMenuItem(value: "+91", child: Text("+91")),
          DropdownMenuItem(value: "+92", child: Text("+92")),
          DropdownMenuItem(value: "+93", child: Text("+93")),
          DropdownMenuItem(value: "+94", child: Text("+94")),
          DropdownMenuItem(value: "+95", child: Text("+95")),
          DropdownMenuItem(value: "+98", child: Text("+98")),
          DropdownMenuItem(value: "+124", child: Text("+124")),
          DropdownMenuItem(value: "+212", child: Text("+212")),
          DropdownMenuItem(value: "+216", child: Text("+216")),
          DropdownMenuItem(value: "+218", child: Text("+218")),
          DropdownMenuItem(value: "+254", child: Text("+254")),
          DropdownMenuItem(value: "+255", child: Text("+255")),
          DropdownMenuItem(value: "+256", child: Text("+256")),
          DropdownMenuItem(value: "+260", child: Text("+260")),
          DropdownMenuItem(value: "+880", child: Text("+880")),
          DropdownMenuItem(value: "+960", child: Text("+960")),
          DropdownMenuItem(value: "+971", child: Text("+971")),
          DropdownMenuItem(value: "+974", child: Text("+974")),
          DropdownMenuItem(value: "+966", child: Text("+966")),
          DropdownMenuItem(value: "+968", child: Text("+968")),
          DropdownMenuItem(value: "+973", child: Text("+973")),
          DropdownMenuItem(value: "+965", child: Text("+965")),


        ] , onChanged:(String? newvalue){
          setState(() {
               selectedCode=newvalue!;
          });
        
           },
          //  dropdownMaxHeight: 150,
           )
         ,),),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide.none, // remove the inner border
        borderRadius: BorderRadius.circular(23),
      ),
     
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Enter valid Mobile Number";
      } else if (value.length != 10) {
        return "Enter 10 digit number";
      }
      return null;
    },
   
  ),
)
;
  }
   Widget DOBTextField(BuildContext context){
    return Container(
      height:54,
  decoration: BoxDecoration(
    color: Colors.white, // background of the field
    borderRadius: BorderRadius.circular(9),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 240, 238, 238), // shadow color
        spreadRadius: 2,  // how wide the shadow spreads
        // blurRadius: 10,    // blur intensity
        offset: Offset(1,1), // x and y offset
      ),
    ],
  ),
  child: TextFormField(
    controller: DOBController,
    keyboardType: TextInputType.number,
    readOnly: true,
    decoration: InputDecoration(
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
      prefixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 5),child: Icon(Icons.calendar_month),)) ,
     
      onTap: (){
        _selectDate(context);
      }, 
    ));
   }
  Future<void>_selectDate(BuildContext context) async{
    DateTime? pickDate=await showDatePicker(context: context, 
    initialDate: DateTime.now(),
    firstDate: DateTime(2000), 
    lastDate: DateTime(2100));
    if(pickDate!=null){
      String formattedDate="${pickDate.day}/${pickDate.month}/${pickDate.year}";
      setState(() {
        DOBController.text=formattedDate;
      });
    }
  }
  Widget checkDetailsButton(){
     
                      return ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: const Color.fromARGB(255, 255, 71, 15),),
                        ),
                          foregroundColor: Colors.white,
                          backgroundColor:const Color.fromARGB(255, 255, 71, 15),
                        ),
                        onPressed: () async{
                        // Use a constant org ID that your API accepts
                      if(_formKey.currentState!.validate()){
                               print("hi");
                                    
                          } 
                        },
                      child:checkDetails());
                 
  }
   Widget checkDetails(){
                      return  Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child:  Text("Check Details",
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
        Widget userTextField(){
          return TextFormField(
        controller:userController,
        keyboardType:TextInputType.number,
        readOnly:true,
        decoration:InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
      prefixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 5),child: Icon(Icons.person_2_outlined),)) ,
          );
        }
        Widget RadioWidget(BuildContext context){
          return Row(
      children: [
        // Male
        Row(
          children: [
            Radio<String>(
              value: "Email",
              groupValue: selectedChoice,
              onChanged: (value) {
                setState(() {
                  selectedChoice = value!;
                });
              },
            ),
            Text("Email ID",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                          ),),
          ],
        ),
        SizedBox(width: 20),

        // Female
        Row(
          children: [
            Radio<String>(
              value: "Mobile",
              groupValue: selectedChoice,
              onChanged: (value) {
                setState(() {
                  selectedChoice = value!;
                });
              },
            ),
           Text("Mobile Number",textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black
                          ),),
          ],
        ),
      ]
          );
        }
        Widget EmailTextField(){
          return TextFormField(
    controller: emailController,
    keyboardType: TextInputType.number,
    readOnly: true,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
      prefixIcon: Padding(padding: EdgeInsets.only(left: 10,right: 5),child: Icon(Icons.email_outlined),)) ,
      validator: (value){
         if(value==null || value.isEmpty){
             return "Please Enter Email";
              }
              return null;
      },
          );
        }
         Widget MobilePTextField(){
          return TextFormField(
    controller: emailController,
    keyboardType: TextInputType.number,
    readOnly: true,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
      ),
      fillColor: Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
      prefixIcon:  Padding(padding: EdgeInsets.only(left: 10,right: 5),
      child: DropdownButtonHideUnderline(child:DropdownButton(
        value: selectedCode,
        items:[
                  DropdownMenuItem(value: "+1", child: Text("+1")),
          DropdownMenuItem(value: "+7", child: Text("+7")),
          DropdownMenuItem(value: "+20", child: Text("+20")),
          DropdownMenuItem(value: "+27", child: Text("+27")),
          DropdownMenuItem(value: "+30", child: Text("+30")),
          DropdownMenuItem(value: "+31", child: Text("+31")),
          DropdownMenuItem(value: "+32", child: Text("+32")),
          DropdownMenuItem(value: "+33", child: Text("+33")),
          DropdownMenuItem(value: "+34", child: Text("+34")),
          DropdownMenuItem(value: "+36", child: Text("+36")),
          DropdownMenuItem(value: "+39", child: Text("+39")),
          DropdownMenuItem(value: "+44", child: Text("+44")),
          DropdownMenuItem(value: "+49", child: Text("+49")),
          DropdownMenuItem(value: "+52", child: Text("+52")),
          DropdownMenuItem(value: "+55", child: Text("+55")),
          DropdownMenuItem(value: "+60", child: Text("+60")),
          DropdownMenuItem(value: "+61", child: Text("+61")),
          DropdownMenuItem(value: "+62", child: Text("+62")),
          DropdownMenuItem(value: "+63", child: Text("+63")),
          DropdownMenuItem(value: "+64", child: Text("+64")),
          DropdownMenuItem(value: "+65", child: Text("+65")),
          DropdownMenuItem(value: "+66", child: Text("+66")),
          DropdownMenuItem(value: "+81", child: Text("+81")),
          DropdownMenuItem(value: "+82", child: Text("+82")),
          DropdownMenuItem(value: "+84", child: Text("+84")),
          DropdownMenuItem(value: "+86", child: Text("+86")),
          DropdownMenuItem(value: "+91", child: Text("+91")),
          DropdownMenuItem(value: "+92", child: Text("+92")),
          DropdownMenuItem(value: "+93", child: Text("+93")),
          DropdownMenuItem(value: "+94", child: Text("+94")),
          DropdownMenuItem(value: "+95", child: Text("+95")),
          DropdownMenuItem(value: "+98", child: Text("+98")),
          DropdownMenuItem(value: "+124", child: Text("+124")),
          DropdownMenuItem(value: "+212", child: Text("+212")),
          DropdownMenuItem(value: "+216", child: Text("+216")),
          DropdownMenuItem(value: "+218", child: Text("+218")),
          DropdownMenuItem(value: "+254", child: Text("+254")),
          DropdownMenuItem(value: "+255", child: Text("+255")),
          DropdownMenuItem(value: "+256", child: Text("+256")),
          DropdownMenuItem(value: "+260", child: Text("+260")),
          DropdownMenuItem(value: "+880", child: Text("+880")),
          DropdownMenuItem(value: "+960", child: Text("+960")),
          DropdownMenuItem(value: "+971", child: Text("+971")),
          DropdownMenuItem(value: "+974", child: Text("+974")),
          DropdownMenuItem(value: "+966", child: Text("+966")),
          DropdownMenuItem(value: "+968", child: Text("+968")),
          DropdownMenuItem(value: "+973", child: Text("+973")),
          DropdownMenuItem(value: "+965", child: Text("+965")),


        ] , onChanged:(String? newvalue){
          setState(() {
               selectedCode=newvalue!;
          });
        
           },
          //  dropdownMaxHeight: 150,
           )
         ,),),),
           validator: (value){
         if(value==null || value.isEmpty){
             return "Please Enter Email";
              }
              return null;
      },
          );
        }
         Widget requestDetailsButton(){
     
                      return ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: const Color.fromARGB(255, 255, 71, 15),),
                        ),
                          foregroundColor: Colors.white,
                          backgroundColor:const Color.fromARGB(255, 255, 71, 15),
                        ),
                        onPressed: () async{
                        // Use a constant org ID that your API accepts
                      if(_formKey.currentState!.validate()){
                               print("hi");
                                    
                          } 
                        },
                      child:requestDetails());
                 
  }
   Widget requestDetails(){
                      return  Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child:  Text("Request New Password",
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
}