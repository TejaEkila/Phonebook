import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phonebook/model/model.dart';

class DataCard extends StatelessWidget {
  DataCard({Key? key, required this.data, required this.edit, required this.index, required this.delete}) : super(key: key);
  //get the datamodel values
  final DataModel data;
  //edit function
  final Function edit;
  final int index;
  //delete function initialize
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactPage(
                          data: data,
                          edit: edit,
                          index: index,
                          delete: delete,
                        )));
          },
          child: ListTile(
            //tileColor: Colors.amber,
            leading: const CircleAvatar(backgroundColor: Colors.amber,
            //child:  Text(data.name.isNotEmpty == true ? data.name[0] : ''),
            ),
            trailing: IconButton(onPressed: (){},icon: const Icon(Icons.call,size: 25,color: Colors.amber,),),
            title: Text(data.name),
            subtitle: Text(data.number),
          ),
        ),
      ]),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key, required this.data, required this.edit, required this.index, required this.delete}) : super(key: key);
  //get the datamodel values
  final DataModel data;
  //edit function
  final Function edit;
  final int index;
  //delete function initialize
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 241, 241, 240),
        actions: [
          IconButton(
            onPressed: () {
              edit(index);
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.amber,
            ),
          ),
          IconButton(
            onPressed: () {
              delete(index);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 241, 241, 240),
      body: Column(
        children: [
          const Gap(30),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(color: Colors.blueGrey, shape: BoxShape.circle),
              child: const Center(child: Text("Z")),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              data.name,
              style: const TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            children: [
              const Gap(70),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,color: Colors.amber,
                    size: 35,
                  )),
              const Gap(70),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message,color: Colors.amber,
                    size: 35,
                  )),
              const Gap(70),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.videocam,color: Colors.amber,
                    size: 45,
                  ))
            ],
          ),
          const Row(
            children: [Gap(80), Text('Call'), Gap(80), Text('Message'), Gap(80), Text('Video')],
          ),
          const Gap(20),
          Stack(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Gap(10),
                    const Padding(
                      padding: EdgeInsets.only(right: 90),
                      child: Text(
                        'Contact info',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(
                        data.number,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        data.email,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
