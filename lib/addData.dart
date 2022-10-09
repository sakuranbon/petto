
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddData(),
    );
  }
}


class AddData extends StatefulWidget {
  const AddData({Key? key}) : super (key: key);

  @override
  State<AddData> createState() => _AddData();
}


class _AddData extends State<AddData>{

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController typeEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();


  
  void addPets()async{

    await FirebaseFirestore.instance.collection('pets').add({
      'name':nameEditingController.text,
      'age':ageEditingController.text,
      'type':typeEditingController.text,
      'type2':type2,
      'sex':sex,

    });


    nameEditingController.clear();
    typeEditingController.clear();
    ageEditingController.clear();

  }

  String type2 = '';
  String sex = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: ()=>Navigator.of(context).pop(),
          child: const Text('←', style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:Container(
                width:double.infinity,),),
            Container(
              padding: const EdgeInsets.only(right: 50,left: 50),
              child:TextField(
                controller:nameEditingController ,
                decoration: const InputDecoration(
                    labelText: '名前', border: OutlineInputBorder()),
            ),),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    children:[
                    Radio(
                      activeColor: Colors.blue,
                      value: 'dog',
                      groupValue: type2,
                      onChanged:(value){
                        setState(() {
                          type2 = value!;
                        });
                      },
                    ),

                    Text('犬')
                    ]
                ),

                Row(
                    children:[
                      Radio(
                        activeColor: Colors.blue,
                        value: 'cat',
                        groupValue: type2,
                        onChanged:(value){
                          setState(() {
                            type2 = value!;
                          });
                        },
                      ),

                      Text('猫')
                    ]
                ),
              ]
            ),

            const SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(right: 50,left: 50),
              child:TextField(
                controller: typeEditingController,
                decoration: const InputDecoration(
                    labelText: '種類', border: OutlineInputBorder()),
            ),),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[Row(
                  children:[
                    Radio(
                      activeColor: Colors.blue,
                      value: 'オス',
                      groupValue: sex,
                      onChanged:(value){
                        setState(() {
                          sex = value!;
                        });
                      },
                    ),

                    Text('オス')
                  ]
              ),
                Row(
                    children:[
                      Radio(
                        activeColor: Colors.blue,
                        value: 'メス',
                        groupValue: sex,
                        onChanged:(value){
                          setState(() {
                            sex = value!;
                          });
                        },
                      ),

                      Text('メス')
                    ]
                ),
              ],
            ),


            const SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(right: 50,left: 50),
              child:TextField(
                controller: ageEditingController,
                decoration: const InputDecoration(
                    labelText: '年齢', border: OutlineInputBorder()),
            ),),

            const SizedBox(height: 20,),


            ElevatedButton(
              onPressed: (){
                addPets();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
              ),
              child: const Text('登録', style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );

  }

}





