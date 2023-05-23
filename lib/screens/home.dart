import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final data=List.generate(20, (index) => 'item_$index');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: ListView.builder(
        itemCount: data.length ,
        itemBuilder: (context, index)=>(
          ListTile(title: Text(data[index]),)
        )
        
        ) ,
      floatingActionButton: FloatingActionButton(onPressed: ()=>null,
       child: const Icon(Icons.add),),
    );
  }
}