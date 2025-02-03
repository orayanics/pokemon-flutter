import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

class Another extends StatelessWidget{
  const Another({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Another Page",
      home: Scaffold (
        appBar: AppBar(
          title: Text("Another"),
        ),
        body: AnotherView(),
      ),
    );
  }
}

class AnotherView extends StatefulWidget {
  const AnotherView({super.key});

  @override
  _AnotherViewState createState() => _AnotherViewState();
}

class _AnotherViewState extends State<AnotherView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              // navigate back
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: Text('Back'),
          )
        ],
      ),
    );
  }
}