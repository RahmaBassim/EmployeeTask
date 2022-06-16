import 'package:flutter/material.dart';
import 'package:tebiat/Modle/Colors.dart';
import 'package:tebiat/Modle/InputText.dart';

import '../Modle/departmentContainer.dart';
import 'Developers.dart';
import 'Marketing.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: InputText(
                      Input: "Employees Departments",
                      Size: 20,
                      TextColor: green,
                      FontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50,),
                Align(
                  alignment: Alignment.centerRight,
                  child: DepartmentContainer(
                    DepartmentName: 'Marketing',
                    Return: Marketing(),
                    image: "images/marketing-logo-design-vector-23546365.jpg",
                  ),
                ),
                SizedBox(height: 50,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DepartmentContainer(
                    DepartmentName: 'Devalopers',
                    Return: Developers(),
                    image: "images/download.png",
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
