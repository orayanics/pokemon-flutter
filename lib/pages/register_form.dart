import 'package:activity_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:activity_flutter/pages/accolades.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset("assets/logo.png", width: 25, height: 25),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        title: const Text("Register Trainer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [DrwHeader(), DrwListView()],
        ),
      ),
      body: SingleChildScrollView(child: RegisterView()),
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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(width: 10),
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Fave Region',
                  border: OutlineInputBorder(),
                ),
              )),
              SizedBox(width: 10),
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Fave Generation', border: OutlineInputBorder()),
              )),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fave Trainer',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Fave Game',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(200, 50),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text("Back"),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Accolades()));
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(200, 50),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Submit"),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
