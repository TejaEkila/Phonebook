// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:phonebook/model/model.dart';
import 'package:phonebook/pages/adduser.dart';
import 'package:phonebook/pages/tail.dart';
import 'package:phonebook/database/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    // TODO: implement initState
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

  void _reset() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => const MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 240),
        title: const Text("CallBook"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddUsers()),
                );
              },
              icon: const Icon(
                Icons.person_add,
                color: Colors.amber,
              )),
          IconButton(
              onPressed: () {
                _reset();
              },
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.amber,
              ))
        ],
      ),
      body: fetching
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: datas.length,
              itemBuilder: ((context, index) => DataCard(
                    data: datas[index],
                    edit: edit,
                    index: index,
                    delete: delete,
                  )
                  ),
            ),
    );
  }

  void Container() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(14),
            content: SizedBox(
              height: 260,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: surnameController,
                    decoration: const InputDecoration(hintText: "Surname"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: numberController,
                    decoration: const InputDecoration(hintText: "Number"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                ],
              ),
            ),
            actions: [
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    DataModel newData = datas[currentIndex];
                    newData.name = nameController.text;
                    newData.surname = surnameController.text;
                    newData.number = numberController.text;
                    newData.email = emailController.text;
                    db.updateData(newData, newData.id!);
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  void edit(index) {
    currentIndex = index;
    nameController.text = datas[index].name;
    surnameController.text = datas[index].surname;
    numberController.text = datas[index].number;
    emailController.text = datas[index].email;
    Container();
  }

  void delete(int index) async {
    db.deleteData(datas[index].id!);
    setState(() {
      datas.removeAt(index);
    });
  }
}
