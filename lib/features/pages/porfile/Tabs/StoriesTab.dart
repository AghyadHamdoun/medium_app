import 'package:flutter/material.dart';


import '../ElevatedStyle.dart';

class Storiestab extends StatefulWidget {
  const Storiestab({super.key});

  @override
  State<Storiestab> createState() => _StoriestabState();
}

class _StoriestabState extends State<Storiestab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            alignment: Alignment.centerRight,
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.grey)
                            )
                          ),
                          onPressed: (){
                          },
                               child:  Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                    Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                                    Text("Public",style: TextStyle(color: Colors.black),),
                                 ],
                               ),
                      ),
                  )
                ]
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1),
              Text("You don't have any public posts",style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,fontWeight: FontWeight.bold),)
            ],
          )
          )
        );
  }
}


