import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'get_api.dart';

class Insert_api extends StatefulWidget {
  const Insert_api({Key? key}) : super(key: key);

  @override
  State<Insert_api> createState() => _Insert_apiState();
}

class _Insert_apiState extends State<Insert_api> {
  TextEditingController name = TextEditingController();
  TextEditingController roll = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController created_by = TextEditingController();

  insert_api() async {
    final response = await http.post(
      Uri.parse('http://192.168.0.106/flutter_api/insert.php'),
      body: jsonEncode(<String, dynamic>{
        "name": name.text,
        "roll": roll.text,
        "dept": dept.text,
        "created_by": created_by.text
      }),
    );
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Image.asset(
              'assets/B_T.png', // Change the path to your logo image
              fit: BoxFit.contain,
              height: 35,
            ),
            SizedBox(width: 1), // Adjust the spacing between logo and title
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Bangladesh Army International University of Science and Technology",
                    style: TextStyle(fontSize: 7.5,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                    "(BAIUST)",
                    style: TextStyle(fontSize: 7.5,fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10,),
            Image.asset(
              'assets/A_T.png', // Change the path to your logo image
              fit: BoxFit.contain,
              height: 35,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius:80,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/12.jpg'),
                      height: 180,
                      width:180,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Text('Koushik Roy', style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),),
              Text('Intern Software Engineer',style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold), ),
              SizedBox(height: 15,),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: roll,
                decoration: InputDecoration(
                  labelText: 'Roll',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: dept,
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              TextFormField(
                controller: created_by,
                decoration: InputDecoration(
                  labelText: 'Created By',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 4.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8,),

              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        insert_api();
                      },

                      child: Text('Submit'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Get_api())); // Corrected line
                      },
                      child: Text('Result'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}