import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

    class HomePage extends StatelessWidget{
      const HomePage({super.key});

      @override
      Widget build(BuildContext context){
        return MaterialApp(
          title: "Home Page",
          home: Scaffold (
            appBar: AppBar(
              title: Text("Home Page"),
            ),
            body: HomeBody(),
          ),
        );
      }
    }

    class HomeBody extends StatefulWidget {
      const HomeBody({super.key});

      @override
      _HomeBodyState createState() => _HomeBodyState();
    }

    class _HomeBodyState extends State<HomeBody> {
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