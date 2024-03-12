import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      String? studentName,studentID,studyProgramID;
      double? studentGPA;
       getStudentName(name){
         this.studentName=name;
       }

      getStudentID(id){
        this.studentID=id;
      }
      getStudyProgramID(ProgramID){
        this.studyProgramID=ProgramID;
      }
      getStudentGPA(gpa){
        this.studentGPA=double.parse(gpa);
      }
      createData(){
         print("Created");
         // DocumentReference documentReference =
        DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
        Map<String, dynamic> students = {
          "studentName": studentName,
          "studentID": studentID,
          "studyProgramID": studyProgramID,
          "studentGPA": studentGPA
        };
        documentReference.set(students).whenComplete(() {
          print("$studentName created");
        });
      }
      readData(){
        print("Read");
      }
      updateData(){
        print("Updated");
      }
      deleteData(){
        print("deleted");
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('Flutter Container'),
        ),
        body: Column(
          children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
                )
              ),
              onChanged: (String name){
                    getStudentName(name);
                },

            ),
          ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
                    )
                ),
                onChanged: (String id){
                  getStudentID(id);
                },

              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Study Program ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
                    )
                ),
                onChanged: (String ProgramID){
                  getStudyProgramID(ProgramID);
                },

              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "GPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
                    )
                ),
                onChanged: (String gpa){
                  getStudentGPA(gpa);
                },

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                       backgroundColor: Colors.blue,

                   ),
                    onPressed: (){
                     createData();
                    }, child: Text("Create",style: TextStyle(color: Colors.white),)
                 ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.blue,

                    ),
                    onPressed: (){
                      readData();
                    }, child: Text("Read",style: TextStyle(color: Colors.white),)
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.blue,

                    ),
                    onPressed: (){
                      updateData();
                    }, child: Text("Update",style: TextStyle(color: Colors.white),)
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.blue,

                    ),
                    onPressed: (){
                      deleteData();
                    }, child: Text("Delete",style: TextStyle(color: Colors.white),)
                )

              ],
            )
          ],
        )


    );
  }
}