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
                      caluclateSum(enterdValue!);
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
    setState(() {
    enterdValue=enterdValue!.substring(0,enterdValue!.length-1);
  });
  }
  void caluclateSum(String value){

    if(value.contains("/0")){
      setState(() {
        res=0;
      });
      return;
    }
    final expression=value.split(RegExp(r'[+\-*/]'));
    final operators=RegExp(r'[+\-*/]').allMatches(value).map((m)=>m.group(0)!).toList();
    int result=int.parse(expression[0]);
    for(int i=0;i<operators.length;i++){
      int next=int.parse(expression[i+1]);
      switch(operators[i]){
        case '+':
          result+=next;
          break;
        case '-':
          result-=next;
          break;
        case '*':
          result*=next;
          break;
        case '/':
          result~/=next;
          break;
      }
    }
      setState(() {
        res=result;
      });
      
    }
  

    // String n1="";
    // String n2="";
    // int? j;
    // if(value.contains("/0")){
      
    // }
    // for(int i=0;i<value.length;i++){
    //   if(value[i]=="+" || value[i]=='-' || value[i]=='*' || value[i]=="/"){
    //     j=i;
    //     break;
    //   }
    //   else{
    //     n1+=value[i];
    //   }
    // }
    // n2=value.substring(j!+1);
    // if(value[j]=='+'){
    //   res=int.parse(n1)+int.parse(n2);
    // }
    // else if(value[j]=='-'){
    //   res=int.parse(n1)-int.parse(n2);
    // }
    // else if(value[j]=='*'){
    //   res=int.parse(n1)*int.parse(n2);
    // }
    // else if(value[j]=='/'){
    //   res=(int.parse(n1)/int.parse(n2)).toInt();
    // }
    
    
  }

List<String> numbers=[
"1","2","3","+",
"4","5","6","-",
"7","8","9","*",
"0"," /","=","X"
];