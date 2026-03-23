import 'package:flutter/material.dart';

class thirdPage extends StatefulWidget {
  const thirdPage ({super.key});

  @override
  State<thirdPage > createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage > {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 90, 144),
      body: SafeArea(child: Center(
        child: Column(
          children: [ 
           //IMAGE PLACE AT THE BOTTON CENTER
            Expanded(flex: 1, child:Align(
              alignment: Alignment.bottomCenter,child: Image.asset("lib/images/keywords.png", height: 160, width: 160,),
              ),),

            Expanded( flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Track Everything with Ease',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Monitor request status, supplier responses, and documents from one organized dashboard.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}