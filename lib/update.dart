import 'package:api_uas/repository.dart';
import 'package:flutter/material.dart';

class Updatepage extends StatefulWidget {
  const Updatepage({ Key? key }) : super(key: key);

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  final titleController = TextEditingController();

  Repository repository = Repository();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if(args[0].isNotEmpty){
      titleController.text = args[0] as String;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Page')
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
          bool response = await repository.updatePage(
            titleController.text);

            if (response) {
              Navigator.popAndPushNamed(context, 'home');
              
            } else {
              throw Exception('Failed to update data');
            }
        }, child: Text('Update'),
        ),
        ],
        ),
        ),

    );
  }
}