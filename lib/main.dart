import 'package:crudflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  final _studentNameController = TextEditingController();
  final _studentIDController = TextEditingController();
  final _studyProgramIDController = TextEditingController();
  final _studentGPAController = TextEditingController();
  String? studentName;
  String? studentID;
  String? studyProgramID;
  double? studentGPA;
  List<Map<String, dynamic>> _studentList = [];

  @override
  void initState(){
    super.initState();
    read();
  }

  Future<void> createData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA,
    };
    await documentReference.set(students);
    print("$studentName created");
     _studentList.add(students);
     setState(() {});
  }

  Future<void> read() async {
    //_studentList.clear(); // Clear existing data before reading
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("MyStudents").get();
    for (var doc in querySnapshot.docs) {
      _studentList.add(doc.data() as Map<String, dynamic>);
    }
    setState(() {});
  }

  void readData() async{
    try {
          // Get a reference to the document
          DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("MyStudents").doc(studentName).get();

          // Check if the document exists
          if (documentSnapshot.exists) {
            // Get data from the document
            Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

            // Access individual fields
            String studentName = data['studentName'];
            String studentID = data['studentID'];
            String studyProgramID = data['studyProgramID'];
            double studentGPA = data['studentGPA'];

            // Do something with the data (e.g., update UI)
            print("Student Name: $studentName");
            print("Student ID: $studentID");
            print("Study Program ID: $studyProgramID");
            print("Student GPA: $studentGPA");
          } else {
            print("Document does not exist");
          }
        } catch (e) {
          print("Error reading document: $e");
        }
  }

  void updateData() {
    print("Updated");
  }

  void deleteData() {
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD'),
      ),
      body: Column(
        children: [
          // Text fields for user input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _studentNameController,
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
              ),
              onChanged: (String name) => setState(() => studentName = name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _studentIDController,
              decoration: InputDecoration(
                labelText: "Student ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
              ),
              onChanged: (String id) => setState(() => studentID = id),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _studyProgramIDController,
              decoration: InputDecoration(
                labelText: "Study Program ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
              ),
              onChanged: (String programID) =>
                  setState(() => studyProgramID = programID),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _studentGPAController,
decoration: InputDecoration(
                labelText: "GPA",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
              ),
              onChanged: (String gpa) =>
                  setState(() => studentGPA = double.tryParse(gpa)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: createData,
                child: Text(
                  "Create",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: readData,
                child: Text(
                  "Read",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: updateData,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: deleteData,
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          // Display student list
          Expanded(
            child: ListView.builder(
  itemCount: _studentList.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(_studentList[index]['studentName'] ?? ""),
    subtitle: Text(
      '${_studentList[index]['studentID'] ?? ""} - ${_studentList[index]['studyProgramID'] ?? ""} - ${_studentList[index]['studentGPA'] ?? ""}',
    ),
  ),
),

          ),
        ],
      ),
    );
  }
}