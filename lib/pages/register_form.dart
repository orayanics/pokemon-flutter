import 'package:activity_flutter/main.dart';
import 'package:activity_flutter/models/trainerInformation.dart';
import 'package:activity_flutter/pages/accolades.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:activity_flutter/validators/trainer_register_validator.dart';

List<TrainerInformation> trainerInfo =[];

final _trainerName = TextEditingController();
bool _validateName = false;

final _trainerAge = TextEditingController();
bool _validateAge = false;
String? _ageErrorText;

final _homeTown = TextEditingController();
bool _validateHome = false;

bool _validateGender = false;

bool _validateTrainerType = false;

final _trainerID = TextEditingController();
bool _validateTrainerID = false;

final _trainerEmail = TextEditingController();
bool _validateEmail = false;

String? _emailErrorText;

final _trainerContact = TextEditingController();
bool _validateContact = false;
String? _contactErrorText;

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

const List<String> generations = <String>['Male', 'Female', 'Others'];
const List<String> trainerType = <String>['Beginner', 'Novice','Gym Leader', 'Breeder', 'Elite Four'];

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  String? _ageErrorText;

  void ValidateFields() {
    setState(() {
      _validateName =
          FieldValidators.validateTrainerName(_trainerName.text) != null;
      _ageErrorText = FieldValidators.validateAge(_trainerAge.text);
      _validateAge = _ageErrorText != null;
      _validateHome = FieldValidators.validateHome(_homeTown.text) != null;
      _validateGender = FieldValidators.validateGender(genValues) != null;
      _validateTrainerID =
          FieldValidators.validateTrainerID(_trainerID.text) != null;
      _emailErrorText =
          FieldValidators.validateTrainerEmail(_trainerEmail.text);
      _validateEmail = _emailErrorText != null;
      _contactErrorText = FieldValidators.validateContact(_trainerContact.text);
      _validateContact = _contactErrorText != null;
      trainerInfo.add(TrainerInformation(
          _trainerName.text,
          _trainerAge.text,
          _homeTown.text,
          trainerTypeValues,
          _trainerID.text,
          genValues,
          "",
          _trainerEmail.text,
          _trainerContact.text));
    });
  }

 int searchUserIndex(String trainerName){
    return trainerInfo.indexWhere((element) => element.trainerName == trainerName);
 }

 void UpdateFields() {
   setState(() {
     _validateName = FieldValidators.validateTrainerName(_trainerName.text) != null;
     _ageErrorText = FieldValidators.validateAge(_trainerAge.text);
     _validateAge = _ageErrorText != null;
     _validateHome = FieldValidators.validateHome(_homeTown.text) != null;
     _validateGender = FieldValidators.validateGender(genValues) != null;
     _validateTrainerID = FieldValidators.validateTrainerID(_trainerID.text) != null;
     _emailErrorText = FieldValidators.validateTrainerEmail(_trainerEmail.text);
     _validateEmail = _emailErrorText != null;
     _contactErrorText = FieldValidators.validateContact(_trainerContact.text);
     _validateContact = _contactErrorText != null;

     if (!_validateName && !_validateAge && !_validateHome && !_validateGender && !_validateTrainerID && !_validateEmail && !_validateContact) {
       int searchedUser = searchUserIndex(_trainerName.text);
       if (searchedUser != -1) {
         trainerInfo[searchedUser].trainerName = _trainerName.text;
         trainerInfo[searchedUser].trainerAge = _trainerAge.text;
         trainerInfo[searchedUser].homeTown = _homeTown.text;
         trainerInfo[searchedUser].trainerType = trainerTypeValues;
         trainerInfo[searchedUser].trainerID = _trainerID.text;
         trainerInfo[searchedUser].gender = genValues;
         trainerInfo[searchedUser].trainerEmail = _trainerEmail.text;
         trainerInfo[searchedUser].contactNumber = _trainerContact.text;
       }
     }
   });
 }

  void DeleteFields() {
    setState(() {
      int searchedUser = searchUserIndex(_trainerName.text);
      if (searchedUser != -1) {
        trainerInfo.removeAt(searchedUser);
      }
    });
  }



  String genValues = generations.first;
  String trainerTypeValues = trainerType.first;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _trainerName,
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                LengthLimitingTextInputFormatter(50)
              ],
              decoration: InputDecoration(
                labelText: 'Trainer Name',
                border: OutlineInputBorder(),
                errorText: _validateName ? 'Trainer Name is required' : null,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _trainerAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(2)
                    ],
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(),
                      errorText: _validateAge ? _ageErrorText : null,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField(
                    value: genValues,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white30),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                      errorText: _validateGender ? "Gender is required" : null,
                    ),
                    items: generations.map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        genValues = value!;
                        _validateGender = FieldValidators.validateGender(
                            genValues) != null;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _homeTown,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100)
              ],
              decoration: InputDecoration(
                labelText: 'Home Town',
                border: OutlineInputBorder(),
                errorText: _validateHome ? 'Home Town is required' : null,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: trainerTypeValues,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.white30),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Trainer Type',
                errorText: _validateTrainerType
                    ? "Trainer Type is required"
                    : null,
              ),
              items: trainerType.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  trainerTypeValues = value!;
                  _validateTrainerType =
                      FieldValidators.validateTrainerType(trainerTypeValues) !=
                          null;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(50)
              ],
              decoration: InputDecoration(
                labelText: 'Favorite Pokemon',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _trainerID,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6)
              ],
              decoration: InputDecoration(
                labelText: 'Trainer ID',
                border: OutlineInputBorder(),
                errorText: _validateTrainerID ? 'Trainer ID is required' : null,
                hintText: '6-digit ID',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _trainerEmail,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      errorText: _validateEmail ? _emailErrorText : null,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _trainerContact,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      border: OutlineInputBorder(),
                      errorText: _validateContact ? _contactErrorText : null,
                    ),
                  ),
                ),
              ],
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
                      fixedSize: Size(150, 60),
                      textStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    ValidateFields();
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(150, 60),
                      textStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                UpdateFields();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  fixedSize: Size(150, 60),
                  textStyle: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Update"),
                  SizedBox(width: 10),
                  Icon(
                    Icons.update,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                DeleteFields();
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  fixedSize: Size(150, 60),
                  textStyle: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Delete"),
                  SizedBox(width: 10),
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height:20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: trainerInfo.length,
              itemBuilder: (context, index) {
                final trainer = trainerInfo[index];
                return ListTile(
                  title: Text(trainer.trainerName),
                  subtitle: Text('Age: ${trainer.trainerAge}, Email: ${trainer
                      .trainerEmail}, Contact: ${trainer.contactNumber}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}