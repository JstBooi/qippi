import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _firstPageState();
}

class _firstPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 90, 144),
      body: SafeArea(child: Center(
        child: Column(
          children: [
           
             //IMAGE PLACE AT THE BOTTON CENTER
            Expanded(flex: 1, child:Align(
              alignment: Alignment.bottomCenter,child: Image.asset("lib/images/supplier (2).png", height: 160, width: 160,),
              ),),

            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Request Quotes in One Click',
                    style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Send out requests and collect quotes from multiple suppliers—instantly and effortlessly.',
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