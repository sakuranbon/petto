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
            Container(
              padding: EdgeInsets.only(right: 50,left: 50),
              child:TextField(
                controller:nameEditingController ,
                decoration: const InputDecoration(
                    labelText: '名前', border: OutlineInputBorder()),
            ),),

            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (value){},
                    ),
                    const Text('犬')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 1,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                    const Text('猫')
                  ],
                )
              ],
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Radio(value: 0,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                    const Text('オス')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 1,
                      groupValue: 0,
                      onChanged: (value) {},
                    ),
                    const Text('メス')
                  ],
                )
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

            FloatingActionButton(
                child:const Text('登録'),
                onPressed: (){
                })

          ],
        ),
      ),
    );
  }
}
