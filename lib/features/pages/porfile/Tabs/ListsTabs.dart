import 'package:flutter/material.dart';

class Liststabs extends StatelessWidget {
  const Liststabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black)
            ),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Ibrahim Meshmeshan"),
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/person1.jpg'),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text("Reading List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline)),
                    SizedBox(width: MediaQuery.of(context).size.width*0.23),
                    Icon(Icons.lock,size: 15,),
                    Text("No Stories")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
