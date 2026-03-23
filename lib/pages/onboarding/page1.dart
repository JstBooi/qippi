import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 90, 144),
      body: SafeArea(child: Center(
        child: Column(
          children: [
            //IMAGE PLACE AT THE BOTTON CENTER
            Expanded(flex: 1, child:Align(
              alignment: Alignment.bottomCenter,child: Image.asset("lib/images/unorganized.png", height: 160, width: 160,),
              ),),
            //TEXT
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fast Quotation Requests',
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
                      'The smart way to manage procurement and quote requests—fast, simple, and stress-free.',
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