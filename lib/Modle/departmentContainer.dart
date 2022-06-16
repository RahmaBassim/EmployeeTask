import 'package:flutter/material.dart';
import 'package:tebiat/Modle/Colors.dart';
import 'package:tebiat/Modle/InputText.dart';

class DepartmentContainer extends StatelessWidget {
  final image;
  final String DepartmentName;
  final Return;

  const DepartmentContainer({super.key,
    required this.DepartmentName,
    required this.Return,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width/1.6,
      height: 100,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: gray),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image)
              )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(Input: DepartmentName, Size: 15, TextColor: green),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Return));
                },
                  child: InputText(Input: "Details", Size: 15, TextColor: gray)),
            ],
          )
        ],
      ),
    );
  }
}
