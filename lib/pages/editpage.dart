// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:phonebook/component/mybutton.dart';
import 'package:phonebook/component/mytextfield.dart';
import 'package:phonebook/model/model.dart';
import 'package:phonebook/database/database.dart';

class Editpage extends StatefulWidget {
  const Editpage({Key? key}) : super(key: key);

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late DB db;

  List<DataModel> datas = [];

  bool fetching = true;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    db = DB();
    getData2();
  }

  void getData2() async {
    datas = await db.getData();
    setState(() {
      fetching = false;
    });
  }

  void edit(index) {
    setState(() {
      currentIndex = index;
      nameController.text = datas[index].name;
      surnameController.text = datas[index].surname;
      numberController.text = datas[index].number;
      emailController.text = datas[index].email;
    });
  }

  void updateData() {
    DataModel newData = datas[currentIndex];
    newData.name = nameController.text;
    newData.surname = surnameController.text;
    newData.number = numberController.text;
    newData.email = emailController.text;
    db.updateData(newData, newData.id!);
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 40),
          child: Text('Edit Data'),
        ),
        actions: [
           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: ElevatedButton(
              
              onPressed: () {
                 print(datas[currentIndex]);
                // Call edit method to populate controllers
                edit(currentIndex);
              },
              child: const Text('Load Data'),
            ),
           ),
          
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Mytextfield(Controller: nameController, hinttext: "Name"),
           Mytextfield(Controller: surnameController, hinttext: "Surname"),
           Mytextfield(Controller: numberController, hinttext: "Number"),
           Mytextfield(Controller: emailController, hinttext: "Email"),
         
          const SizedBox(height: 20),
          Mybutton(ontap: updateData, text: 'Update')
        ],
      ),
    );
  }
}
