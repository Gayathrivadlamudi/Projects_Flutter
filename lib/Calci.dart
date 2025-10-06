import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Calci(),
  debugShowCheckedModeBanner: false,
  ));
}
class Calci extends StatefulWidget{
const  Calci({super.key});
_CalciState createState()=>_CalciState();
}
class _CalciState extends State<Calci>{
 String? enterdValue="";
 int res=0;
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Center(child:Text("Calci 📱",style: TextStyle(color: Colors.white,fontSize: 27),)),
    backgroundColor:Color( 0xFF691F0C),
    ),
    backgroundColor: Color(0xFFD3C0B2),
    body: 
    Center(child: Container(
      height:500,
      width: 320,
      decoration: BoxDecoration(color: Colors.white,
      border: Border.all(color: Color(0xFF691F0C),
      width: 1.8),
      borderRadius: BorderRadius.circular(23),
      boxShadow: [
        BoxShadow(offset: Offset(2, 2),
        blurRadius: 2.8)
      ]
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:14),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 11, 11, 11),
            borderRadius: BorderRadius.circular(23)),
           child:SizedBox(
               height: 120,
            width: 300,
            child: 
            Padding(padding: EdgeInsets.only(top: 14,right: 12),
            child:Column(
              children: [
                Text( enterdValue!,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 23,color: Colors.white),
              ),
              SizedBox(height: 14,),
              Text(res.toString(),style: TextStyle(color: Colors.white,fontSize: 23),),
              ],
            ),)
            
            )
          ),
          SizedBox(height: 14,),
          Container(
            height: 329,
            width: 293,
            decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(23)),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 4,
              children: List.generate(numbers.length,(index){
                return Center(child:ElevatedButton(onPressed: (){
                  setState(() {
                    if(numbers[index]=="="){
                      calculateSum(enterdValue!);
                    }
                    else if(numbers[index]=="X"){
                      delete();
                      if(enterdValue==""){
                        setState(() {   
                        res=0;
                      });
                      }
                    }
                    else{
                       enterdValue=enterdValue!+numbers[index];
                    }
                  });
                }, child: Text( numbers[index],style: TextStyle(color: const Color.fromARGB(255, 17, 16, 16),fontSize: 19),))
                );
              }),

            ),
            ),
           ],
      ),
    ) ,)
    );
  }
  void delete(){
    if(enterdValue!=null || enterdValue!.isNotEmpty){
    setState(() {
    enterdValue=enterdValue!.substring(0,enterdValue!.length-1);
  });
    }
  }
  void calculateSum(String value){
        //so in dart we dont have stack so we use list as stack
        int result=0;
        int num=0;
        List<int> stack=[];
        String sign='+';
        for(int i=0;i<value.length;i++){
          String c=value[i];
          if(RegExp(r'\d').hasMatch(c)){
              num=num*10+int.parse(c);
          }
          if(!(RegExp(r'\d').hasMatch(c)) ||i==value.length-1){
            if(sign=='+'){
              stack.add(num);
            }
            else if(sign=='-'){ 
              stack.add(-num);
            }
            else if(sign=='*'){
              stack.add(stack.removeLast()*num);
            }
            else if(sign=='/' ){
              if(num!=0){
              stack.add(stack.removeLast()~/num);
              }
              else{
                res=0;
                return;
              }
            }
            sign=c;
             num=0;
          }
          }
            for(int i in stack){
          result+=i;
        }
   
      setState(() {
        res=result;
      });  
        }
    }
List<String> numbers=[
"1","2","3","+",
"4","5","6","-",
"7","8","9","*",
"0","/","=","X"
];