import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Register",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Padding(padding: EdgeInsets.all(10), child: RegisterView()),
      ),
    );
  }
}

const List<String> generations = <String>['One', 'Two', 'Three', 'Four'];
const List<String> regions = <String>['One', 'Two', 'Three', 'Four'];

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String genValues = generations.first;
  String regValues = regions.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Nickname',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Favorite Pokemon',
            border: OutlineInputBorder(),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          DropdownButton(
            value: genValues,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            items: generations.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                genValues = value!;
              });
            },
          ),
          DropdownButton(
            value: regValues,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            items: regions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                regValues = value!;
              });
            },
          ),
        ]),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Fave Type',
                border: OutlineInputBorder(),
              ),
            )),
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Fave Region',
                border: OutlineInputBorder(),
              ),
            )),
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Fave Generation', border: OutlineInputBorder()),
            )),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Fave Trainer',
            border: OutlineInputBorder(),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Fave Game',
            border: OutlineInputBorder(),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            // navigate back
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
          child: Text('Back'),
        ),
      ],
    );
  }
}
