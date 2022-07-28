import 'package:api_uas/repository.dart';
import 'package:flutter/material.dart';

class Createpage extends StatefulWidget {
  const Createpage({ Key? key }) : super(key: key);

  @override
  _CreatepageState createState() => _CreatepageState();
}

class _CreatepageState extends State<Createpage> {
  final titleController = TextEditingController();

  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Page')
        ),
        body: Container(padding: EdgeInsets.all(20),
        child: Column(
          children: [
        TextField(
          controller: titleController,
            decoration: InputDecoration(hintText: 'title'),
        ),
        SizedBox(height: 10,
        ),
        ElevatedButton(onPressed: () async {
          bool response = await repository.createData(titleController.text);

            if (response) {
              Navigator.popAndPushNamed(context, 'home');
              
            } else {
              throw Exception('Failed to load data');
            }
        }, child: Text('Submit'),
        ),
        ],
        ),
        ),

    );
  }
}