import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tebiat/Modle/Colors.dart';
import 'package:tebiat/Modle/InputText.dart';
import 'package:tebiat/View/Developers.dart';
import 'package:tebiat/View/Marketing.dart';


class NewEmployee extends StatefulWidget {
  @override
  State<NewEmployee> createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  TextEditingController Id= TextEditingController();

  TextEditingController Name= TextEditingController();

  TextEditingController Age= TextEditingController();

  TextEditingController Salary= TextEditingController();

  String x="choice Department";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InputText(Input: "Add New Employee", Size: 15, TextColor: white),
        centerTitle: true,
        backgroundColor: green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputText(
                    Input: "Enter Employee ID: " , Size: 15, TextColor: black),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter ID",
                      labelText: "ID",
                      border: OutlineInputBorder(),
                    ),
                    controller: Id,
                  ),
                ),
                InputText(
                    Input: "Enter Employee Name: " , Size: 15, TextColor: black),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                    controller: Name,
                  ),
                ),
                InputText(
                    Input: "Enter Employee Age: " , Size: 15, TextColor: black),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Age",
                      labelText: "Age",
                      border: OutlineInputBorder(),
                    ),
                    controller: Age,
                  ),
                ),
                InputText(
                    Input: "Enter Employee Salary: " , Size: 15, TextColor: black),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Salary",
                      labelText: "Salary",
                      border: OutlineInputBorder(),
                    ),
                    controller: Salary,
                  ),
                ),
                ExpansionTile(title: Text(x),
                  children: [
                    ListTile(
                      title: Text("Marketing",),
                      onTap: (){
                        x="Marketing";
                        setState(() {});},),
                    ListTile(
                      title: Text("Developers",),
                      onTap: (){
                        setState(() {
                          x="Developers";});},),
                  ],),
                SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () async{
                        String y= Id.text.toString();
                        if(x!="choice Department"&& Id.text.isNotEmpty &&Name.text.isNotEmpty&& Age.text.isNotEmpty&& Salary.text.isNotEmpty){
                          await FirebaseFirestore.instance.collection(x).doc("$y").set(
                              {
                                "Id": Id.text,
                                "Name": Name.text,
                                "Age": Age.text,
                                "Salary": Salary.text
                              });
                          if (x=="Marketing"){
                            Navigator.pop(context, MaterialPageRoute(builder: (context)=>Marketing()));
                          }
                          else {
                            Navigator.pop(context, MaterialPageRoute(builder: (context)=>Developers()));
                          }
                        }
                      },
                      child: InputText(Input: "Add", Size: 20, TextColor: white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
