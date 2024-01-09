import 'package:flutter/material.dart';
import 'package:phonebook/component/mybutton.dart';
import 'package:phonebook/component/mytextfield.dart';
import 'package:phonebook/model/model.dart';
import 'package:phonebook/database/database.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  late DB db;

  List<DataModel> datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = DB();
    getData2();
  }

  void getData2() async {
    datas = await db.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Mytextfield(Controller: nameController, hinttext: "Name"),
          Mytextfield(Controller: surnameController, hinttext: "Surname"),
          Mytextfield(Controller: numberController, hinttext: "Number"),
          Mytextfield(Controller: emailController, hinttext: "Email"),
          Mybutton(
            ontap: () {
              DataModel datalocal = DataModel(name: nameController.text, surname: surnameController.text, number: numberController.text, email: emailController.text);
              db.insertDB(datalocal);
              // One datalocal.id = 1;
              setState(() {  
                datas.add(datalocal);
              });
              nameController.clear();
              surnameController.clear();
              nameController.clear();
              emailController.clear();
              Navigator.pop(context);
            },
            text: 'Save',
          ),
        ],
      ),
    );
  }
}
