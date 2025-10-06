import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ToDoApp(),
  ));
}
class ToDoApp extends StatefulWidget {
  ToDoApp({super.key,});
  @override
  _ToDoApp createState() => _ToDoApp();
}

class _ToDoApp extends State<ToDoApp> {
  late DateTime today;
  late String formatedDate;
  List<Task>tasks=[];
  TextEditingController taskNameController=TextEditingController();
  TextEditingController taskDetailsController=TextEditingController();
  bool showContainer=false;
  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    List<String> months = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  ]; // <-- do not redeclare with DateTime
    formatedDate = "${today.day} ${months[today.month-1]} ${today.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 173, 253),
      body: Column(
        children: [
         mainHeading("Gayathri Chowdary",formatedDate),
    Flexible(
  child: tasks.isEmpty
      ? emptyTasksWidget()
      : tasks.every((t) => t.isDone)
          ? allTasksCompletedWidget()
          : TaskBars(),
      ),
     
        ]
      ),
       floatingActionButton:AddButton(),
    );
  }

















Widget mainHeading(String name, String date) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    // decoration: BoxDecoration(color: const Color.fromARGB(255, 245, 167, 255)),
    height:275,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for Welcome text + optional profile avatar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Animated Welcome Text
            Expanded(
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "Welcome $name",
                    speed: Duration(milliseconds: 100),
                    textStyle: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [const Color.fromARGB(255, 20, 28, 35), const Color.fromARGB(255, 233, 108, 255)],
                        ).createShader(Rect.fromLTWH(0, 0, 300, 50)),
                    ),
                    // cursor: '|', // optional blinking cursor
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
            SizedBox(width: 12),
            // Profile Avatar (optional)
            CircleAvatar(
              radius:68,
              backgroundImage: AssetImage('assets/profile.png'), // replace with your image
            ),
          ],
        ),
        SizedBox(height: 12),
        // Current Date
        Text(
          "Today $date",
          style: TextStyle(
            fontSize: 22,
            color: const Color.fromARGB(179, 0, 0, 0),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        // Pending Tasks Count
        Text(
          "${tasks.where((t) => !t.isDone).length} tasks pending",
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(137, 0, 0, 0),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}

  //BottomButton
  Widget AddButton(){
    return FloatingActionButton.extended(onPressed: (){
        showModalBottomSheet(context: context,
        isScrollControlled: true,//allows full screen bottom
        shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(23),
        ),
        builder:(context){
          return addTaskDetails(context,  isEdit:false,task:null);
        }
        ); 
    },
    label: Text("Add a Task",style: TextStyle(color: const Color.fromARGB(255, 23, 23, 23)),),
    );
  }

Widget addTaskDetails(BuildContext context,{bool isEdit=false,Task? task}){
  if(isEdit && task!=null){
    taskNameController.text=taskNameController.text.isEmpty? task.name:taskNameController.text;
    taskDetailsController.text=taskDetailsController.text.isEmpty? task.details:taskDetailsController.text;
  }
  else{
    taskNameController.clear();
    taskDetailsController.clear();
  }
  return SingleChildScrollView(child: Container(
      height: MediaQuery.of(context).size.height*0.9,
      width: MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
        gradient: LinearGradient(colors: [const Color.fromARGB(255, 240, 181, 252),const Color.fromARGB(255, 123, 189, 244)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight)
      ) ,
      child: 
      Padding(padding: EdgeInsets.only(top:23,left: 23,right: 23),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Task Name",textAlign: TextAlign.left,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          SizedBox(height: 14,),
          TextField(
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            controller: taskNameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              hintText: "Enter Task Name",
              hintStyle: TextStyle(color: const Color.fromARGB(255, 18, 18, 18),fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
            ),
            // Border when focused
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255), width: 2),
            ),
            errorBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white)
            )
            ),
          ),
          SizedBox(height: 23,),
          Text("Detail's About Task",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          SizedBox(height:14),
          TextField(
            style: TextStyle(color: const Color.fromARGB(255, 16, 15, 15)),
            controller: taskDetailsController,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              hintText:"Enter Your Task Details",
              hintStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontWeight:FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255), width: 1),
            ),

            // Border when focused
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255), width: 2),
            ), 
            ),
          ),
          SizedBox(height: 28,),
          Align(
            alignment:Alignment.center,
            child: ElevatedButton(
           style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            onPressed: (){
          
             addingContainer();
         
           Navigator.pop(context);
          }, child: Text("Submit",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 16),)) ,
          )
         
        ],
      ),),
    ),) ;
 
}
void addingContainer(){
 setState(() {
   tasks.add(Task(name: taskNameController.text,details: taskDetailsController.text));
   taskNameController.clear();
   taskDetailsController.clear();
  
 });
}
Widget TaskBars(){
   if(tasks.isEmpty){
    return emptyTasksWidget();
  }
  return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context,index){
              final task=tasks[index]; 
              //to make container height dynamically we remove height and keepe and padding              
              return  listItem(task,tasks);
              }); 
}
              Widget listItem(Task task,List<Task> tasks){
                return Padding(padding: EdgeInsets.only(left: 19,right: 19,bottom: 16),child:   Container(
                // margin: EdgeInsets.only(bottom: 41,left: 23,right: 16),//so listview give each item full width so even it applies there will be visible changes
                padding: EdgeInsets.all(16),
                // width: 200, 
                   
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: LinearGradient(colors:[ Colors.purple,Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
              ),
              child:Row(
                children: [
                  Checkbox(value: task.isDone, onChanged: (bool? value){
                    setState(() {
                      task.isDone=value??false;//onchange will togle the present value
                     
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)
                  ),
                  activeColor: Colors.white,
                  checkColor: Colors.black,),
                  Expanded(child: task.isDone?  Text("${task.name} is Done",style: TextStyle(color: Colors.white,fontSize: 23),):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(task.name,style: TextStyle(color: Colors.white,fontSize: 23),),
                        SizedBox(height: 14,),
                        Text(task.details,style: TextStyle(color: Colors.white,fontSize: 14),),
                      ],) ,     
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                             IconButton(onPressed: (){
                          // addTaskDetails(context);  if we write this single line then it will not show in body because this just call the funtion and the funtion returns a widget
                          //so we need to use showModelBottomSheet
                          showModalBottomSheet(context: context,builder:(context){
                            return addTaskDetails(context,isEdit: true,task: task);
                          } );
                         }, 
                      icon: Icon(Icons.edit),color: Colors.white,),
                      SizedBox(width: 12,),
                      IconButton(onPressed: (){
                          setState(() {
                            tasks.remove(task);
                          }); },
                           icon:Icon(Icons.delete),color: Colors.white, )],
                        ),
                      ) 
                ],  )
            ),);
}


Widget allTasksCompletedWidget() {

   return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height:370,
      width: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.emoji_events, size: 80, color: Colors.white),
          SizedBox(height: 20),
          Text(
            "🎉 Congratulations! 🎉",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "You completed all your tasks today.\nYou're one step closer to your dreams!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
            SizedBox(height: 12),
            ElevatedButton(onPressed: (){
              setState(() {
                tasks.clear();
              });
            }, child:Text("NextDay"))
        ],
      ),
    );
}

Widget emptyTasksWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Main circular icon
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.all(24),
              child: Icon(
                Icons.task_alt,
                size: 80,
                color: const Color.fromARGB(255, 27, 26, 26),
              ),
            ),

            // First Clock with Thread
            Positioned(
              top: -70,
              left: 0,
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(2, 40), // thread width & height
                    painter: ThreadPainter(),
                  ),
                  Icon(Icons.access_time, size: 28, color: const Color.fromARGB(179, 0, 0, 0)),
                ],
              ),
            ),

            // Second Clock with Thread
            Positioned(
              top: -80,
              left: 60,
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(2, 50),
                    painter: ThreadPainter(),
                  ),
                  Icon(Icons.access_time, size: 24, color: const Color.fromARGB(153, 22, 21, 21)),
                ],
              ),
            ),

            // Third Clock with Thread
            Positioned(
              top: -60,
              right: 20,
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(2, 35),
                    painter: ThreadPainter(),
                  ),
                  Icon(Icons.access_time, size: 20, color: const Color.fromARGB(137, 28, 26, 26)),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 30),

        // Main Text
        Text(
          "No tasks yet!",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: [Colors.purple, Colors.pink],
              ).createShader(Rect.fromLTWH(0, 0, 200, 50)),
          ),
        ),
        SizedBox(height: 12),

        // Subtext
        Text(
          "Tap the + button to add your first task",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(179, 5, 5, 5),
          ),
        ),

        SizedBox(height: 25),

        // Optional Lottie Animation
      
      ],
    ),
  );
}

// Custom Painter for the thread



}
class Task{
  final String name;
  final String details;
  bool isDone;
  Task({required this.name,required this.details,this.isDone=false});
}
class ThreadPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(179, 0, 0, 0)
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

