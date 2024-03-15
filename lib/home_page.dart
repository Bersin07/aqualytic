import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

//sign user out
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body:  SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //name
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 5,),

                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 5,),
                      Text(
                        'Bersin B',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                        )
                    ],
                  ),
                  //profile pic
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),

            SizedBox(height: 25,),
        
            //card how do you feel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    //animation or pic
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.amberAccent,
                    ),

                    SizedBox(width: 20,),
              
                    // how do you feel and get start button
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How do you feel?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            SizedBox(height: 12,),
                          Text(
                            'Fil out your medical card right now',
                            style: TextStyle(
                              fontSize: 14
                            ),
                            ),
                            SizedBox(height: 12,),

                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple[300],
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text(
                                'Get started',

                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 25,),
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 183, 217, 255),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search
                    ),
                    border: InputBorder.none,
                    hintText: 'How can we help you',
                  ),
                  
                ),
              ),
            ),

            SizedBox(height: 25,),
        
            //horizontal list view -> categories surgeon
            Container(
              height: 80,
              child: ListView(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    child: Row(
                      children: [
                        
                        Text('Dentist'),
                      ],
                    ),
                  )
                ],
              ),
            )
        
            // doctor list
          ],
        ),
      ),
    );
        
  }
}
