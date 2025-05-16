import 'package:flutter/material.dart';

class AboutTabs extends StatelessWidget {
  const AboutTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("You haven't added any\n"
              " information here yet\n",
            style: TextStyle(

                color: Colors.black,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          ),
          TextButton(onPressed: (){}, child: Text("Add a short bio",style: TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline
          ),))
        ],
      ),
    );
  }
}
