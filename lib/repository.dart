import 'dart:convert';
import 'package:api_uas/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Repository {
  String uri = 'https://jsonplaceholder.typicode.com/albums' ;

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(uri));
    
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      List<Person> person = it.map((e) => Person.fromJson(e)).toList();
      return person;
      
    } else {
      throw Exception('Failed to load data');
    }
    } catch (e) {
      return e.toString();
    }
    
  }

  Future createData(String title) async{
    
   try {
    final response = await http.post(Uri.parse(uri), body: {
      'title' : title,
    });

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
    
  } catch (e) {
    return e.toString();
  }
}

Future updatePage(String title) async{
  try {
    final response = await http.put(Uri.parse('$uri/$title'), 
  body:{
      'title' : title,
  });

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
    
  } catch (e) {
    return e.toString();
  }
}
Future deleteData(String id) async{
  try {
    final response = await http.delete(Uri.parse('$uri/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
    
  } catch (e) {
    return e.toString();
  }
}
}
