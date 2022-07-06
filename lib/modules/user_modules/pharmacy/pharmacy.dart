import 'package:flutter/material.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class Pharmacy extends StatelessWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pharmacy..", style: TextStyle(color: mainColor, fontSize: 26.0),),
            const SizedBox(height: 15.0,),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => drugItem(),
                  separatorBuilder: (context, index) => Container(
                        color: mainColor,
                        
                        width: double.infinity,
                        height: 2.0,
                      ),
                  itemCount: 10),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: forthColor,
        ),
      ),
    );
  }

  Widget drugItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: mainColor,radius: 25.0,
            child:const Text("2",textScaleFactor: 2,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("name of Drug",style: TextStyle(fontSize: 18.0),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Expiry date : 02:04:2023",style: TextStyle(fontSize: 14.0),),
                ],
              ),
            ),

          ),
          defaultMatrialButton(text: "Request",function: (){}),
        ],
      ),
    );
  }
}
