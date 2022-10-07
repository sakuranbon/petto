
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addData.dart';



class  Pets extends StatefulWidget {
  Pets({Key? key}) : super(key: key);



  @override
  State<Pets> createState() => _PetsState();

}


class _PetsState extends State<Pets> {

  late Stream<QuerySnapshot> query = FirebaseFirestore.instance.collection('pets').snapshots();


  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> dog = FirebaseFirestore.instance.collection('pets').where('type2',isEqualTo: 'dog').snapshots();
    Stream<QuerySnapshot> cat = FirebaseFirestore.instance.collection('pets').where('type2',isEqualTo: 'cat').snapshots();
    Stream<QuerySnapshot> up = FirebaseFirestore.instance.collection('pets').orderBy('age').snapshots();
    Stream<QuerySnapshot> down = FirebaseFirestore.instance.collection('pets').orderBy('age',descending: true).snapshots();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Petto'),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text('犬のみ'),
              ),const PopupMenuItem(
                value: 2,
                child: Text('猫のみ'),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text('年齢：昇順'),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text('年齢：降順'),
              ),
            ],
            onSelected: (value){
              if(value==1){
                setState(() {
                  query = dog;
                });

              }else if(value==2) {
                setState(() {
                  query = cat;
                });
              }else if(value==3){
                setState(() {
                  query = up;
                });
              }else {
                setState(() {
                  query = down;
                });
              }
            },
          )


        ],
      ),

      body: StreamBuilder<QuerySnapshot>(
          stream: query,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> usersData = snapshot.data!.docs;
              return ListView.separated(
                itemCount: usersData.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> userData = usersData[index]
                      .data()! as Map<String, dynamic>;
                  return
                    Text('名前:${userData['name']}  品種:${userData['type']}  性別:${userData['sex']}  年齢:${userData['age']}');
                  },
                separatorBuilder: (BuildContext context,
                    int index) => const Divider(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      ),

      floatingActionButton: FloatingActionButton(onPressed: () =>
      {Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const MyApp();
        }))}, child: const Icon(Icons.add),),
    );
  }
}