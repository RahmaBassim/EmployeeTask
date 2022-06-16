import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tebiat/Modle/Colors.dart';
import 'package:tebiat/Modle/InputText.dart';
import '../Modle/NewEmployee.dart';


class Developers extends StatelessWidget {
  TextEditingController Name= TextEditingController();

  TextEditingController Age= TextEditingController();

  TextEditingController Salary= TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:InputText(Input: "Developers Team", Size: 15, TextColor: white,FontWeight: FontWeight.bold,),
        backgroundColor: green,
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Developers").snapshots(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: size.width/2,
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: () async{
                                    FirebaseFirestore.instance.collection("Developers").doc(snapshot.data!.docs[index].id).delete();
                                  }, icon: Icon(Icons.delete,size: 40,color: green,)),
                                  IconButton(onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (context)=>AlertDialog(
                                          title: InputText(Input: "Update Data", Size: 15, TextColor: green,FontWeight: FontWeight.bold,),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                TextField(
                                                  controller: Name,
                                                  decoration: InputDecoration(
                                                      hintText: "Update Name"
                                                  ),
                                                ),
                                                TextField(
                                                  controller: Age,
                                                  decoration: InputDecoration(
                                                      hintText: "Update Age"
                                                  ),
                                                ),
                                                TextField(
                                                  controller: Salary,
                                                  decoration: InputDecoration(
                                                      hintText: "Update Salary"
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () async{
                                                  String Edit =  "${snapshot.data!.docs[index]["Id".toString()]}";
                                                  await FirebaseFirestore.instance.collection("Developers")
                                                      .doc("$Edit").update(
                                                      {
                                                        "Name": Name.text,
                                                        "Age": Age.text,
                                                        "Salary": Salary.text,
                                                      });
                                                },
                                                child: InputText(
                                                  Input: "Update",
                                                  Size: 15,
                                                  TextColor: green,
                                                  FontWeight: FontWeight.bold,))
                                          ],
                                        ));
                                  },
                                      icon: Icon(Icons.edit,size: 40,color: green,)),
                                ],
                              ),
                              InputText(
                                  Input: "Employee Name: ", Size: 15, TextColor: black),
                              InputText(
                                Input: "${snapshot.data!.docs[index]["Name".toString()]}",
                                Size: 15, TextColor: green, FontWeight: FontWeight.bold,),
                              InputText(
                                  Input: "Employee Age: ", Size: 15, TextColor: black),
                              InputText(
                                Input: "${snapshot.data!.docs[index]["Age".toString()]}",
                                Size: 15, TextColor: green, FontWeight: FontWeight.bold,),
                              InputText(
                                  Input: "Employee Salary: ", Size: 15, TextColor: black),
                              InputText(
                                Input: "${snapshot.data!.docs[index]["Salary".toString()]}",
                                Size: 15, TextColor: green, FontWeight: FontWeight.bold,),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewEmployee()));
        },
        child: Center(
          child: Icon(Icons.add,size: 40,color: white,),),
      ),
    );
  }
}
