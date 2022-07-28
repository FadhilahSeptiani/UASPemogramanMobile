import 'package:api_uas/create.dart';
import 'package:api_uas/person.dart';
import 'package:api_uas/repository.dart';
import 'package:api_uas/update.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
      routes: {
        'home' : (context) => HomePage(),
        'create' : (context) => Createpage(),
        'update' : (context) => Updatepage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();
  List<Person> listPerson = [];

  getData() async{
    listPerson = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAS Pemograman Mobile'),
      ),
      body: ListView.builder(
        itemCount: listPerson.length,
        itemBuilder: (context, index) {
          Person person = listPerson[index];
        return InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, 'update', arguments:[person.title]);
          },
          child: Dismissible(
            key: Key(person.title),
            confirmDismiss: (direction) {
              return showDialog(context: context, builder: (context){
                return AlertDialog(title: Text('Delete Data'),
                content: Text('Are u sure for delete this data?'),
                actions: [
                TextButton(onPressed: () async {
                  bool response = await repository.deleteData(person.title);

                  if (response) {
                    Navigator.pop(context, true);
                  } else {
                    Navigator.pop(context, false);
                  }
                }, child: Text('Yes')),
                TextButton(onPressed: () {
                  Navigator.pop(context, false);
                }, child: Text('No')),],);
              },
              );
            },
            child: ListTile(leading: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('images/bunga.png'),
              fit: BoxFit.cover)),
            ),
            title: Text(person.title),
            ),
          ),
        );
},
),
floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.popAndPushNamed(context, 'create');
  },
  child: Icon(Icons.add),
  ),
);
  }
}